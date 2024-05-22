package com.remake.weplay.match.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.match.model.dao.MatchRepository;
import com.remake.weplay.match.model.vo.MatchApplication;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private MatchRepository matchRepository;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int applyMatch(MatchApplication matchApp) {
		return matchRepository.applyMatch(sqlSession, matchApp);
	}

	@Override
	public List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds) {
		return matchRepository.getRecievedApplications(sqlSession, teamNo, rowBounds);
	}

	@Override
	public List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds) {
		return matchRepository.getSentApplications(sqlSession, teamNo, rowBounds);
	}



}
