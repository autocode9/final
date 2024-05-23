package com.remake.weplay.team.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.remake.weplay.team.model.dao.TeamMapper;
import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamServiceImpl implements TeamService {
	
	private final TeamMapper teamMapper;
	
	@Override
	public int countTeams(HashMap<String, String> map) {
		return teamMapper.countTeams(map);
	}
	
	@Override
	public List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds) {
		return teamMapper.selectTeams(map, rowBounds);
	}

	@Override
	public Team selectTeam(int teamNo) {
		return teamMapper.selectTeam(teamNo);
	}

	@Override
	public int applyCheck(TeamApplication teamApp) {
		return teamMapper.applyCheck(teamApp);
	}
	
	@Override
	public int joinTeam(TeamApplication teamApp) {
		return teamMapper.joinTeam(teamApp);
	}
	

	@Override
	public int insertTeam(TeamMember teamMember) {
		return teamMapper.insertTeam(teamMember);
	}

	@Override
	public int updateTeamApp(TeamApplication teamApp) {
		return teamMapper.updateTeamApp(teamApp);
	}

	
	//팀 신청자 목록
	@Override
	public List<TeamApplication> selectTeamApplication(HashMap<String, String> map, RowBounds rowBounds) {
		return teamMapper.selectTeamApplication(map, rowBounds);
	}
	
	@Override
	public int selectTeamApplicationCount(HashMap<String, String> map) {
		return teamMapper.selectTeamApplicationCount(map);
	}

	@Override
	public int deleteTeam(int teamNo) {
		return teamMapper.deleteTeam(teamNo);
	}



}
