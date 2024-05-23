package com.remake.weplay.city.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.city.model.dao.CityMapper;
import com.remake.weplay.city.model.vo.City;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityMapper cityMapper;
	
	// 시/도 목록 조회
	@Override
	public List<City> selectCities() { 
		return cityMapper.selectCities();
	}
	
	// 시/군/구 목록 조회
	@Override
	public List<City> selectDistricts(String city) {
		return cityMapper.selectDistricts(city);
	}
	
}
