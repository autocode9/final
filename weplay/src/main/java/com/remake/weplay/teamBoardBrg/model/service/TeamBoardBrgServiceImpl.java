package com.remake.weplay.teamBoardBrg.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.remake.weplay.teamBoardBrg.model.dao.TeamBoardBrgMapper;
import com.remake.weplay.teamBoardBrg.model.vo.TeamBoardBrg;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamBoardBrgServiceImpl implements TeamBoardBrgService {

	private final TeamBoardBrgMapper teamBoardBrgMapper;
	
//
//	@Autowired
//	private TeamBoardBrgRepository teamBoardBrgRepository;
//	
//	@Autowired
//	private SqlSessionTemplate sqlSession;
	
	
	/***
	 * 팀보드 셀렉트
	 */
	@Override
	public List<TeamBoardBrg> selectList(int teamNo) {
//		return teamBoardBrgRepository.selectList(sqlSession, teamNo);
		return teamBoardBrgMapper.selectList(teamNo);
	}


	/**
	 * 팀보드 삭제 (팀보드코드 변수)
	 */
	@Override
	public int deleteTeamBoardBrg(int boardCode) {
//		return teamBoardBrgRepository.deleteTeamBoardBrg(sqlSession,boardCode);
		return teamBoardBrgMapper.deleteTeamBoardBrg(boardCode);
	}

	/***
	 * 팀보드 입력
	 */
	@Override
	public int insertTeamBoardBrg(TeamBoardBrg teamBoardBrg) {
//		return teamBoardBrgRepository.insertTeamBoardBrg(sqlSession, teamBoardBrg);
		return teamBoardBrgMapper.insertTeamBoardBrg(teamBoardBrg);
	}

	
	
}
