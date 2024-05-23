package com.remake.weplay.city.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.remake.weplay.city.model.vo.City;

@Mapper
public interface CityMapper {
	
	public List<City> selectCities();

	public List<City> selectDistricts(String city);
}
