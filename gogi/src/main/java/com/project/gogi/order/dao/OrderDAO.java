package com.project.gogi.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.order.vo.OrderVO;

public interface OrderDAO {
	public void insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException;
	public void updatePoint(MemberVO memberVO) throws DataAccessException;
}
