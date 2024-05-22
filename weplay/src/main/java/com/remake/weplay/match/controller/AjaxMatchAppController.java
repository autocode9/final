package com.remake.weplay.match.controller;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.match.model.service.MatchService;
import com.remake.weplay.match.model.vo.MatchApplication;

@RestController
@RequestMapping(value="matchApp", produces="application/json; charset=UTF-8")
public class AjaxMatchAppController {
	
	@Autowired
	private MatchService matchService;
	@Autowired
	private Gson gson;
	
	@GetMapping("/getMatchApplications")
	public String getMatchApplication(int teamNo, int recievedLimit, int sentLimit) {
		List<MatchApplication> recievedList = matchService.getRecievedApplications(teamNo, new RowBounds(0, recievedLimit));
		List<MatchApplication> sentList = matchService.getSentApplications(teamNo, new RowBounds(0, sentLimit));
		JSONObject result = new JSONObject();
		result.put("recievedList", recievedList);
		result.put("sentList", sentList);
		return gson.toJson(result);
	}
}
