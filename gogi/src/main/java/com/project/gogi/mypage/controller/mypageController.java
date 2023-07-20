package com.project.gogi.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface mypageController {
	
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//개인정보 수정
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
     	   @RequestParam("value")  String value,
     	   HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//폼 처리
		public  ModelAndView form(@RequestParam(value = "result", required = false) String result,
				@RequestParam(value = "goods_id", required = false) String goods_id,
				@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
				HttpServletResponse response) throws Exception;
}
