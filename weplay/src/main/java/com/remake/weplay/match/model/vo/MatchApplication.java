package com.remake.weplay.match.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MatchApplication {
	
	private int applyNo;
	private int homeTeam;
	private int awayTeam;
	private int memberNo;
	private int fieldNo;
	private String applyName;
	private String applyPhone;
	private String applyContent;
	private String matchTime;
	private String matchDate;
	private String matchDateTime;
	private String applyDate;
	private String status;

	private String opponentName;
	private String fieldName;
	private String applyInfo;
}
