package com.remake.weplay.match.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.remake.weplay.match.model.dao.MatchMapper;
import com.remake.weplay.match.model.vo.Match;
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

	@Override
	public int recievedListCount(int teamNo) {
		return matchMapper.recievedListCount(teamNo);
	}
	
	@Override
	public int sentListCount(int teamNo) {
		return matchMapper.sentListCount(teamNo);
	}

	@Override
	public String updateMatchApplication(MatchApplication matchApp) {
		int result = matchMapper.updateMatchApplication(matchApp);
		if(result > 0) return "Y";
		else return "N";
	}

	@Override
	public String insertMatch(Match match) {
		int result = matchMapper.insertMatch(match);
		if(result > 0) return "Y";
		else return "N";
	}

	@Override
	public int upcomingMatchCount(int teamNo) {
		return matchMapper.upcomingMatchCount(teamNo);
	}
	
	@Override
	public int previousMatchCount(int teamNo) {
		return matchMapper.previousMatchCount(teamNo);
	}
	
	@Override
	public List<Match> getUpcomingMatches(int teamNo, RowBounds rowBounds) {
		return matchMapper.getUpcomingMatches(teamNo);
	}

	@Override
	public List<Match> getPreviousMatches(int teamNo, RowBounds rowBounds) {
		return matchMapper.getPreviousMatches(teamNo);
	}




}
