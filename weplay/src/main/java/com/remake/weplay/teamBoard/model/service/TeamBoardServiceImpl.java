package com.remake.weplay.teamBoard.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.remake.weplay.team.model.vo.TeamMember;
import com.remake.weplay.teamBoard.model.dao.TeamBoardMapper;
import com.remake.weplay.teamBoard.model.vo.TeamBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamBoardServiceImpl implements TeamBoardService{


	private final TeamBoardMapper teamBoardMapper;
	
	/***
	 * 셀렉트
	 */


	@Override
	public List<TeamBoard> selectList(int boardCode) {
		return teamBoardMapper.selectList(boardCode);
	}

	@Override
	public int insertTeamBoard(TeamBoard teamBoard) {
		return teamBoardMapper.insertTeamBoard(teamBoard);
	}

	@Override
	public List<TeamMember> selectTeamMemberList(int teamNo) {
		return teamBoardMapper.selectTeamMemberList(teamNo);
	}
	
	
	
	
}
