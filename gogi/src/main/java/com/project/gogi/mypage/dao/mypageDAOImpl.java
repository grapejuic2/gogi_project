package com.project.gogi.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

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
	public mypageVO selectMyDetailInfo(String myp_id) throws DataAccessException {
		mypageVO mypageVO=(mypageVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",myp_id);
		return mypageVO;
	}
	
}
