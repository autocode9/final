package com.remake.weplay.match.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.remake.weplay.match.model.vo.MatchApplication;

public interface MatchService {

	int applyMatch(MatchApplication matchApp);

	List<MatchApplication> getRecievedApplications(int teamNo, RowBounds rowBounds);

	List<MatchApplication> getSentApplications(int teamNo, RowBounds rowBounds);
	
	int recievedListCount(int teamNo);
	
	int sentListCount(int teamNo);

	int updateMatchApplication(MatchApplication matchApp);

}
