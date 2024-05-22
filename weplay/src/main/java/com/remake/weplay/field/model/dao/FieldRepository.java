package com.remake.weplay.field.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.field.model.vo.Field;

@Repository
public class FieldRepository {

	public int countFields(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("fieldMapper.countFields", map);
	}
	
	public List<Field> selectFields(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds) {
		return sqlSession.selectList("fieldMapper.selectFields", map, rowBounds);
	}


}
