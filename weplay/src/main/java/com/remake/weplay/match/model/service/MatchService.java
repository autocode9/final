package com.remake.weplay.match.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.match.model.vo.Match;
import com.remake.weplay.match.model.vo.MatchApplication;

public interface MatchService {

	int applyMatch(MatchApplication matchApp);

	List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds);

	List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds);
	
	int recievedListCount(int teamNo);
	
	int sentListCount(int teamNo);

	String updateMatchApplication(MatchApplication matchApp);

	String insertMatch(Match match);

	int upcomingMatchCount(int teamNo);
	
	int previousMatchCount(int teamNo);
	
	List<Match> getUpcomingMatches(int teamNo, RowBounds rowBounds);

	List<Match> getPreviousMatches(int teamNo, RowBounds rowBounds);


}
