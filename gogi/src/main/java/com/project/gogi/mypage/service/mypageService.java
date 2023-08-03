package com.project.gogi.mypage.service;

import java.util.List;
import java.util.Map;

import com.project.gogi.goods.vo.ReviewVO;
import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.order.vo.OrderVO;

public interface mypageService {
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;
	public MemberVO myDetailInfo(String mem_id) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public int deleteMember(String mem_id) throws Exception;
	public List<ReviewVO> reviewList(String mem_id) throws Exception;
}
