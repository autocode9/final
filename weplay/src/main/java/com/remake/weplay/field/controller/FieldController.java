package com.remake.weplay.field.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.remake.weplay.field.model.service.FieldService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FieldController {
	
	private final FieldService fieldService;
	
	@GetMapping("fields")
	public String forwardToFields() {
		return "field/fields";
	}
	
	@GetMapping("field")
	public ModelAndView forwardToFieldInfo(ModelAndView mv, int fieldNo) {
		mv.addObject("field", fieldService.selectField(fieldNo)).setViewName("field/fieldInfo");
		return mv;
	}
	
}
