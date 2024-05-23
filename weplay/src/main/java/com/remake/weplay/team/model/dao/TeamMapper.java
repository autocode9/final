package com.remake.weplay.team.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.remake.weplay.team.model.vo.Team;
import com.remake.weplay.team.model.vo.TeamApplication;
import com.remake.weplay.team.model.vo.TeamMember;

@Mapper
public interface TeamMapper {

	public int countTeams(HashMap<String, String> map);
	
	public List<Team> selectTeams(HashMap<String, String> map, RowBounds rowBounds);

	public Team selectTeam(int teamNo);

	public int applyCheck(TeamApplication teamApp);
	
	public int joinTeam(TeamApplication teamApp);

	public List<TeamApplication> selectTeamApplication(HashMap<String, String> map, RowBounds rowBounds);
	
	public int selectTeamApplicationCount(HashMap<String, String> map);
	//팀멤버 삽입
	public int insertTeam(TeamMember teamMember);
	//팀신청자 업데이트
	public int updateTeamApp(TeamApplication teamApp);
}
