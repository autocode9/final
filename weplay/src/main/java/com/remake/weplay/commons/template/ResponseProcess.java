package com.remake.weplay.commons.template;

import org.springframework.http.ResponseEntity;

import com.remake.weplay.commons.model.vo.ResponseData;

public interface ResponseProcess {
	
	public ResponseEntity<ResponseData> success(Object body);
	
	public ResponseEntity<ResponseData> fail(String message);
	
	
	
}
