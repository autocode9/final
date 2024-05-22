package com.remake.weplay.field.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Field {
	
	private int fieldNo;
	private String fieldName;
	private String location;
	private String ground;
	private String size;
	private String builtYear;
	
}
