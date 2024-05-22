package com.remake.weplay.field.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.field.model.dao.FieldRepository;
import com.remake.weplay.field.model.vo.Field;

@Service
public class FieldServiceImpl implements FieldService {
	
	@Autowired
	private FieldRepository fieldRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int countFields(HashMap<String, String> map) {
		return fieldRepository.countFields(sqlSession, map);
	}
	
	@Override
	public List<Field> selectFields(HashMap<String, String> map, RowBounds rowBounds) {
		return fieldRepository.selectFields(sqlSession, map, rowBounds);
	}
	


}
