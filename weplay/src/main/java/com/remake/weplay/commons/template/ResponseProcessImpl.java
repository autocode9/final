package com.remake.weplay.commons.template;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import com.remake.weplay.commons.model.vo.ResponseData;

@Component
public class ResponseProcessImpl implements ResponseProcess {

	@Override
	public ResponseEntity<ResponseData> success(Object data) {
		return ResponseEntity.ok()
					         .headers(HttpData.getHeaderJson())
		                     .body(ResponseData.builder().data(data).message("응답 성공").responseCode("00").build());
	}

	@Override
	public ResponseEntity<ResponseData> fail(String message) {
		return ResponseEntity.badRequest()
		         			 .headers(HttpData.getHeaderJson())
		         			 .body(ResponseData.builder().data(message).message("응답 실패").responseCode("01").build());
	}

}
