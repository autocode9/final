package com.remake.weplay.match.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.match.model.vo.MatchApplication;

@Mapper
public interface MatchMapper {
	
	public int applyMatch(MatchApplication matchApp);

	public List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds);
	
	public List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds);
	
	
}