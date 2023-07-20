package com.project.gogi.mypage.service;

import java.util.Map;

import com.project.gogi.mypage.vo.mypageVO;

public interface mypageService {
	
	public mypageVO modifyMyInfo(Map memberMap) throws Exception;
	public mypageVO myDetailInfo(String myp_id) throws Exception;
}
