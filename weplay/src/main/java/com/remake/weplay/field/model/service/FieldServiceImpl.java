package com.remake.weplay.field.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.remake.weplay.field.model.dao.FieldMapper;
import com.remake.weplay.field.model.vo.Field;
import com.remake.weplay.field.model.vo.FieldRental;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FieldServiceImpl implements FieldService {
	
	private final FieldMapper fieldMapper;
	
	@Override
	public int countFields(HashMap<String, String> map) {
		return fieldMapper.countFields(map);
	}
	
	@Override
	public List<Field> selectFields(HashMap<String, String> map, RowBounds rowBounds) {
		return fieldMapper.selectFields(map, rowBounds);
	}

	@Override
	public Field selectField(int fieldNo) {
		return fieldMapper.selectField(fieldNo);
	}

	@Override
	public List<String> findByRentalDate(FieldRental fieldRental) {
		return fieldMapper.findByRentalDate(fieldRental);
	}

	@Override
	public String addRental(FieldRental fieldRental) {
		if(fieldMapper.addRental(fieldRental) > 0 ) return "Y";
		else return "N";
	}

	@Override
	public List<FieldRental> getRentals(FieldRental fieldRental, RowBounds rowBounds) {
		return fieldMapper.getRentals(fieldRental, rowBounds);
	}
	


}
