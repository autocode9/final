package com.remake.weplay.match.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Match {
	
	private int matchNo;
	private int fieldNo;
	private int homeTeam;
	private int awayTeam;
	private String matchDate;
	private String matchTime;
	private int homeScore;
	private int awayScore;
	private String status;
	
	private String homeTeamName;
	private String awayTeamName;
	private String homeTeamLogo;
	private String awayTeamLogo;
	private String fieldName;
	private String score;
}
