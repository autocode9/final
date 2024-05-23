package com.remake.weplay.match.controller;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.match.model.service.MatchService;
import com.remake.weplay.match.model.vo.MatchApplication;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("matchApp")
@RequiredArgsConstructor
public class AjaxMatchAppController {
	
	private final MatchService matchService;

	private final Gson gson;
	
	@GetMapping("/getMatchApplications")
	public ResponseEntity<ResponseData> getMatchApplication(int teamNo, int recievedLimit, int sentLimit) {
		
		int recievedListCount = matchService.recievedListCount(teamNo);
		int sentListCount = matchService.sentListCount(teamNo);
		List<MatchApplication> recievedList = matchService.getRecievedApplications(teamNo, new RowBounds(0, recievedLimit));
		List<MatchApplication> sentList = matchService.getSentApplications(teamNo, new RowBounds(0, sentLimit));
		
		Map<String, Object> result = new HashMap();
		result.put("recievedListCount", recievedListCount);
		result.put("sentListCount", sentListCount);
		result.put("recievedList", recievedList);
		result.put("sentList", sentList);
		
		ResponseData rd = new ResponseData().builder().data(result).message("응답 성공").responseCode("00").build();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}
	
	@PostMapping("/updateMatchApplication")
	public ResponseEntity<ResponseData> updateMatchApplication(MatchApplication matchApp) {
		int result = matchService.updateMatchApplication(matchApp);
		String data;
		
		if(result > 0) data = "상태 업데이트 성공";
		else data = "상태 업데이트 실패";
		
		ResponseData rd = new ResponseData().builder().data(data).message("응답 성공").responseCode("00").build();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}
	
}
