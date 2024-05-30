package com.remake.weplay.commons.template;

import java.nio.charset.Charset;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

public class HttpData {
	
	public static HttpHeaders getHeaderJson() {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		return headers;
	}
	

}
