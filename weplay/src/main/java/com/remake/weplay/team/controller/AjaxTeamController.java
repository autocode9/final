package com.remake.weplay.team.controller;


import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import com.remake.weplay.city.model.vo.City;
import com.remake.weplay.commons.model.vo.PageInfo;
import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.commons.template.ResponseProcess;
import com.remake.weplay.team.model.service.TeamService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value="teams", produces="application/json; charset=UTF-8")
@RequiredArgsConstructor
public class AjaxTeamController {

	private final TeamService teamService;
	private final ResponseProcess responseProcess;
	private final Gson gson;
	
	@GetMapping("/{page}")
	public ResponseEntity<ResponseData> selectTeams(City city, @RequestParam(value="keyword", defaultValue="all") String keyword,@PathVariable("page") int currentPage) {
		HashMap<String, String> map = new HashMap();
		
		map.put("sido", city.getSido());
		map.put("sigungu", city.getSigungu());
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(teamService.countTeams(map), currentPage, 10, 10);
		
		Map<String, Object> data = new HashMap();
		data.put("pageInfo", pi);
		data.put("teams", teamService.selectTeams(map, Pagination.getRowBounds(pi)));
		
		return responseProcess.success(data);
	}

}
