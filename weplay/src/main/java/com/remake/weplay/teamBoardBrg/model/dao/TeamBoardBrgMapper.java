package com.remake.weplay.teamBoardBrg.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

@Mapper
public interface TeamBoardBrgMapper {

	List<TeamBoardBrg> selectList(int teamNo);
	
	int insertTeamBoardBrg (TeamBoardBrg teamBoardBrg);
	
	int deleteTeamBoardBrg (int boardCode);
}
