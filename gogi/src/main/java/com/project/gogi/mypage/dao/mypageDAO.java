package com.project.gogi.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.mypage.vo.mypageVO;

public interface mypageDAO {
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public mypageVO selectMyDetailInfo(String myp_id) throws DataAccessException;
}
