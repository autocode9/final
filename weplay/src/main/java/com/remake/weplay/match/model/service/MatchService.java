package com.remake.weplay.match.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.match.model.vo.Match;
import com.remake.weplay.match.model.vo.MatchApplication;

public interface MatchService {

	int applyMatch(MatchApplication matchApp);

	List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds);

	List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds);
	
	int recievedListCount(int teamNo);
	
	int sentListCount(int teamNo);

	int updateMatchApplication(MatchApplication matchApp);

	int insertMatch(Match match);

	Map<String, List<Match>> getMyTeamMatches(int teamNo);

}
