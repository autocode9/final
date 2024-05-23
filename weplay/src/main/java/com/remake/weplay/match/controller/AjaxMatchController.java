package com.remake.weplay.match.controller;

import java.nio.charset.Charset;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
		
		int result = matchService.insertMatch(match);
		String data;
		
		if(result > 0) data = "Y";
		else data = "N";
		
		ResponseData rd = new ResponseData().builder().data(data).message("응답 성공").responseCode("00").build();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		return new ResponseEntity<ResponseData>(rd, headers, HttpStatus.OK);
	}
}
