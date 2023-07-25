package com.project.gogi.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.member.vo.MemberVO;

public interface mypageDAO {
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String mem_id) throws DataAccessException;
	public int deleteMember(String mem_id) throws DataAccessException;
}
