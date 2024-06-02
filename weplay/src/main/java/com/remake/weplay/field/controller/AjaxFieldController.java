package com.remake.weplay.field.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.commons.model.vo.PageInfo;
import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.commons.template.Pagination;
import com.remake.weplay.commons.template.ResponseProcess;
import com.remake.weplay.field.model.service.FieldService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("fields")
@RequiredArgsConstructor
public class AjaxFieldController {

	private final FieldService fieldService;
	private final ResponseProcess responseProcess;
	
	@GetMapping("/{page}")
	public ResponseEntity<ResponseData> selectFields(String category, @RequestParam(value="query", defaultValue="all") String query, @PathVariable("page") int currentPage) {
		
		HashMap<String, String> map = new HashMap();
		map.put("category", category);
		map.put("query", query);
		
		PageInfo pi = Pagination.getPageInfo(fieldService.countFields(map), currentPage, 10, 10);
		
		Map<String, Object> data = new HashMap();
		data.put("pageInfo", pi);
		data.put("fields", fieldService.selectFields(map, Pagination.getRowBounds(pi)));
		return responseProcess.success(data);
	}
}
