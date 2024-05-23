package com.remake.weplay.match.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.match.model.service.MatchService;
import com.remake.weplay.match.model.vo.Match;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("match")
@RequiredArgsConstructor
public class AjaxMatchController {
	
	private final MatchService matchService;
	
	@PostMapping("/insertMatch")
	public ResponseEntity<ResponseData> insertMatch(Match match) {
		
		return null;
	}
}
