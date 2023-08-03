package com.project.gogi.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.goods.vo.ReviewVO;
import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.vo.mypageVO;
import com.project.gogi.order.vo.OrderVO;

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
	
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException{
		List<OrderVO> myOrderHistList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList",dateMap);
		return myOrderHistList;
	}
	
	public void updateMyOrderCancel(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderCancel",order_id);
	}
	
	@Override
	public int deleteMember(String mem_id) throws DataAccessException {
		int result = sqlSession.delete("mapper.mypage.deleteMember", mem_id);
		return result;
	}

	@Override
	public List<ReviewVO> selectReviewList(String mem_id) throws Exception {	
		List<ReviewVO> reviewList = sqlSession.selectList("mapper.review.myReviewList", mem_id);
		return reviewList;
	}

}
