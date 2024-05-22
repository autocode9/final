package com.remake.weplay.match.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.remake.weplay.match.model.vo.MatchApplication;

@Repository
public class MatchRepository {

	public int applyMatch(SqlSessionTemplate sqlSession, MatchApplication matchApp) {
		return sqlSession.insert("matchMapper.applyMatch", matchApp);
	}

	public List<MatchApplication> getRecievedApplications(SqlSessionTemplate sqlSession, int teamNo, RowBounds rowBounds) {
		return sqlSession.selectList("matchMapper.getRecievedApplications", teamNo, rowBounds);
	}

	public List<MatchApplication> getSentApplications(SqlSessionTemplate sqlSession, int teamNo, RowBounds rowBounds) {
		return sqlSession.selectList("matchMapper.getSentApplications", teamNo, rowBounds);
	}
	
	
}
