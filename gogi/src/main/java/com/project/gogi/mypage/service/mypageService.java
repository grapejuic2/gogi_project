package com.project.gogi.mypage.service;

import java.util.Map;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.vo.mypageVO;

public interface mypageService {
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	public MemberVO myDetailInfo(String myp_id) throws Exception;
}