package com.remake.weplay.match.controller;

import javax.servlet.http.HttpSession;

import com.remake.weplay.match.model.service.MatchService;
import com.remake.weplay.match.model.vo.MatchApplication;
import com.remake.weplay.member.model.vo.Member;
import com.remake.weplay.team.model.service.TeamService;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequiredArgsConstructor
public class MatchController {
	
	private final TeamService teamService;

	private final MatchService matchService;
	
	@GetMapping("matchApplicationForm")
	public ModelAndView forwardToMatchAF(HttpSession session, ModelAndView mv, @RequestParam(defaultValue="0") int awayTeamNo) {
		int teamNo = ((Member)session.getAttribute("loginUser")).getTeamNo();
		if(awayTeamNo > 0) {
			mv.addObject("awayTeam", teamService.selectTeam(awayTeamNo));
		}
		mv.addObject("homeTeam", teamService.selectTeam(teamNo)).setViewName("match/matchApplicationForm");
		return mv;
	}
	
	@PostMapping("applyMatch")
	public String applyMatch(MatchApplication matchApp) {
		matchApp.setMatchDate(matchApp.getMatchDate() + " " + matchApp.getMatchDateTime());
		matchService.applyMatch(matchApp);
		return "redirect:matchApplications";
	}
	
	@GetMapping("matchApplications")
	public  String forwardToMatchApplications() {
		return "match/matchApplications";
	}
	
	
}
