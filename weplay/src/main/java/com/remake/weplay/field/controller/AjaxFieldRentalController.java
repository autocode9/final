package com.remake.weplay.field.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.remake.weplay.commons.model.vo.ResponseData;
import com.remake.weplay.commons.template.ResponseProcess;
import com.remake.weplay.field.model.service.FieldService;
import com.remake.weplay.field.model.vo.FieldRental;
import com.remake.weplay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("rental")
@RequiredArgsConstructor
public class AjaxFieldRentalController {
	
	private final FieldService fieldService;
	private final ResponseProcess responseProcess;
	
	@GetMapping("/rentalTime")
	public ResponseEntity<ResponseData> checkRentalTime(FieldRental fieldRental){
		return responseProcess.success(fieldService.findByRentalDate(fieldRental));
	}
	
	@PostMapping
	public ResponseEntity<ResponseData> addRental(HttpSession session, FieldRental fieldRental){
		fieldRental.setMemberNo(((Member)session.getAttribute("loginUser")).getUserNo());
		String data = fieldService.addRental(fieldRental);
		if(data.equals("Y")) return responseProcess.success(data);
		else return responseProcess.fail(data);
	}
	
	@GetMapping
	public ResponseEntity<ResponseData> getRentals(HttpSession session, FieldRental fieldRental, int limit){
		fieldRental.setMemberNo(((Member)session.getAttribute("loginUser")).getUserNo());
		List<FieldRental> data = fieldService.getRentals(fieldRental, new RowBounds(0, limit));
		return responseProcess.success(data);
	}
	
	
}
