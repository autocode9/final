package com.remake.weplay.field.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.remake.weplay.field.model.vo.Field;

@Mapper
public interface FieldMapper {
	
	public int countFields(HashMap<String, String> map);
	
	public List<Field> selectFields(HashMap<String, String> map, RowBounds rowBounds);


}
