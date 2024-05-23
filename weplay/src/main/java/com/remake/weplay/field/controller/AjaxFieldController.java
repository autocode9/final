package com.remake.weplay.field.controller;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.remake.weplay.commons.model.vo.PageInfo;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.field.model.service.FieldService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value="fields", produces="application/json; charset=UTF-8")
@RequiredArgsConstructor
public class AjaxFieldController {

	private final FieldService fieldService;
	
	private final Gson gson;
	
	@GetMapping("/{page}")
	public String selectFields(String category, @RequestParam(value="query", defaultValue="all") String query, @PathVariable("page") int currentPage) {
		
		HashMap<String, String> map = new HashMap();
		map.put("category", category);
		map.put("query", query);
		
		PageInfo pi = Pagination.getPageInfo(fieldService.countFields(map), currentPage, 10, 10);
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(pi);
		jsonArr.add(fieldService.selectFields(map, Pagination.getRowBounds(pi)));
		return gson.toJson(jsonArr);
	}
}
