package com.project.gogi.mypage.service;

import java.util.Map;

import com.project.gogi.member.vo.MemberVO;

public interface mypageService {
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	public MemberVO myDetailInfo(String mem_id) throws Exception;

}
