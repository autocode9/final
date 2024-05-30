package com.remake.weplay.match.controller;

import java.util.HashMap;
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
import com.remake.weplay.match.model.vo.Match;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("match")
@RequiredArgsConstructor
public class AjaxMatchController {
	
	private final MatchService matchService;
	private final ResponseProcess responseProcess;
	
	@PostMapping("/insertMatch")
	public ResponseEntity<ResponseData> insertMatch(Match match) {	
		String data = matchService.insertMatch(match);
		if(data.equals("Y")) return responseProcess.success(data);
		else return responseProcess.fail(data);
	}
	
	@GetMapping("/upcomingMatch")
	public ResponseEntity<ResponseData> getUpcomingMatches(int teamNo, int matchLimit) {
		Map<String, Object> data = new HashMap();
		data.put("listCount", matchService.upcomingMatchCount(teamNo));
		data.put("matchList", matchService.getUpcomingMatches(teamNo, new RowBounds(0, matchLimit)));
		
		return responseProcess.success(data);
	}
	
	@GetMapping("/previousMatch")
	public ResponseEntity<ResponseData> getPreviousMatches(int teamNo, int matchLimit) {
		Map<String, Object> data = new HashMap();
		data.put("listCount", matchService.previousMatchCount(teamNo));
		data.put("matchList", matchService.getPreviousMatches(teamNo, new RowBounds(0, matchLimit)));

		return responseProcess.success(data);
	}
	
	
}
