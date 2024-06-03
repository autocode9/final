package com.remake.weplay.field.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.remake.weplay.field.model.vo.Field;
import com.remake.weplay.field.model.vo.FieldRental;

@Mapper
public interface FieldMapper {
	
	public int countFields(HashMap<String, String> map);
	
	public List<Field> selectFields(HashMap<String, String> map, RowBounds rowBounds);

	public Field selectField(int fieldNo);

	public List<String> findByRentalDate(FieldRental fieldRental);

	public int addRental(FieldRental fieldRental);

	public List<FieldRental> getRentals(FieldRental fieldRental, RowBounds rowBounds);


}
