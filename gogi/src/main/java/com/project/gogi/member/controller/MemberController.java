package com.project.gogi.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.member.vo.MemberVO;

public interface MemberController {

	// 로그인
	public ModelAndView loginForm(@RequestParam Map<String, String> loginMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	// 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 회원 가입
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO member,
			 HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//아이디 중복검사
	public ResponseEntity checkId(@RequestParam("mem_id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//폼 처리
	public  ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "goods_id", required = false) String goods_id,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
