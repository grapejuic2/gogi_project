package com.project.gogi.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.goods.vo.ReviewVO;
import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.order.vo.OrderVO;

public interface mypageDAO {
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String mem_id) throws DataAccessException;
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;
	public int deleteMember(String mem_id) throws DataAccessException;
	public void updateMyOrderCancel(String order_id) throws DataAccessException;
	public List<ReviewVO> selectReviewList(String mem_id) throws Exception;
}
