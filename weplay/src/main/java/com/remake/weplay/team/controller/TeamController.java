package com.remake.weplay.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.team.model.service.TeamService;
import com.remake.weplay.team.model.vo.Team;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TeamController {

	private final TeamService teamService;

	@GetMapping("allTeams")
	public String forwardToAllTeams() {
		return "team/allTeams";
	}

	@GetMapping("teamInfo")
	public ModelAndView forwardToTeamInfo(ModelAndView mv, int teamNo) {
		Team team = teamService.selectTeam(teamNo);
		if (team != null) {
			mv.addObject("team", team).setViewName("team/teamInfo");
		} else {
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	@ResponseBody
	@PostMapping("delete.team")
	public String delete(int teamNo, Model model) {
		
		return teamService.deleteTeam(teamNo) > 0 ? "success" : "fail";
	}

}
