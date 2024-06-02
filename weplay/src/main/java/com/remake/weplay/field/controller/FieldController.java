package com.remake.weplay.field.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FieldController {
	
	@GetMapping("fields")
	public String forwardToFields() {
		return "field/fields";
	}
	
}
