package com.remake.weplay.teamBoard.model.dao;

import java.util.List;

import com.remake.weplay.team.model.vo.TeamMember;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;


public interface TeamBoardMapper {
	List<TeamBoard> selectList(int boardCode);
	
	int insertTeamBoard (TeamBoard teamBoard);
	
	List<TeamMember> selectTeamMemberList(int teamNo);
	
	
	
}
