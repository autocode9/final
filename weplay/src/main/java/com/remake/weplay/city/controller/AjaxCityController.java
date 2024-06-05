package com.remake.weplay.city.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.city.model.service.CityService;
import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.commons.template.ResponseProcess;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value="city", produces="application/json; charset=UTF-8")
@RequiredArgsConstructor
public class AjaxCityController {
	

	private final CityService cityService;
	private final ResponseProcess responseProcess;
	
	@GetMapping
	public ResponseEntity<ResponseData> selectCities() {
		return responseProcess.success(cityService.selectCities());
	}
	
	@GetMapping("/{city}")
	public ResponseEntity<ResponseData> selectDistricts(@PathVariable("city") String city) {
		return responseProcess.success(cityService.selectDistricts(city));
	}
}
