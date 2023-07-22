package com.project.gogi.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.vo.mypageVO;

public interface mypageDAO {
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String mem_id) throws DataAccessException;
	public String checkpw(String pw) throws DataAccessException;
}
