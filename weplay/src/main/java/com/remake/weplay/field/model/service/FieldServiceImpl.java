package com.remake.weplay.field.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.remake.weplay.field.model.dao.FieldMapper;
import com.remake.weplay.field.model.vo.Field;

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
	


}
