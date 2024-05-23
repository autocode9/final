package com.remake.weplay.match.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.remake.weplay.match.model.dao.MatchMapper;
import com.remake.weplay.match.model.vo.MatchApplication;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MatchServiceImpl implements MatchService {
	
	private final MatchMapper matchMapper;

	@Override
	public int applyMatch(MatchApplication matchApp) {
		return matchMapper.applyMatch(matchApp);
	}

	@Override
	public List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds) {
		return matchMapper.getRecievedApplications(teamNo, rowBounds);
	}

	@Override
	public List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds) {
		return matchMapper.getSentApplications(teamNo, rowBounds);
	}



}
