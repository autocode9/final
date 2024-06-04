package com.remake.weplay.field.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class FieldRental {
	
	int rentalNo;
	int fieldNo;
	int memberNo;
	String fieldName;
	String location;
	String rentalDate;
	String rentalTime;
	String reservedDate;
	String status;
	
}
