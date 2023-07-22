package com.project.gogi.mypage.dao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.vo.mypageVO;

@Repository("mypageDAO")
public class mypageDAOImpl implements mypageDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}

	@Override
	public MemberVO selectMyDetailInfo(String mem_id) throws DataAccessException {
		MemberVO mypageVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",mem_id);
		return mypageVO;
	}

}
