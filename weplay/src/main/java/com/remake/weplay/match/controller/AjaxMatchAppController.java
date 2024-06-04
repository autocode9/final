package com.remake.weplay.match.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.commons.template.ResponseProcess;
import com.remake.weplay.match.model.service.MatchService;
import com.remake.weplay.match.model.vo.MatchApplication;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("matchApp")
@RequiredArgsConstructor
public class AjaxMatchAppController {
	
	private final MatchService matchService;
	private final ResponseProcess responseProcess;
	
	@GetMapping("/getMatchApplications")
	public ResponseEntity<ResponseData> getMatchApplication(int teamNo, int recievedLimit, int sentLimit) {
		
		int recievedListCount = matchService.recievedListCount(teamNo);
		int sentListCount = matchService.sentListCount(teamNo);
		List<MatchApplication> recievedList = matchService.getRecievedApplications(teamNo, new RowBounds(0, recievedLimit));
		List<MatchApplication> sentList = matchService.getSentApplications(teamNo, new RowBounds(0, sentLimit));
		
		Map<String, Object> data = new HashMap();
		data.put("recievedListCount", recievedListCount);
		data.put("sentListCount", sentListCount);
		data.put("recievedList", recievedList);
		data.put("sentList", sentList);

		return responseProcess.success(data);
	}
	
	@PostMapping("/updateMatchApplication")
	public ResponseEntity<ResponseData> updateMatchApplication(MatchApplication matchApp) {
		String data = matchService.updateMatchApplication(matchApp);
		if(data.equals("Y")) return responseProcess.success(data);
		else return responseProcess.fail(data);
	}
	
}
