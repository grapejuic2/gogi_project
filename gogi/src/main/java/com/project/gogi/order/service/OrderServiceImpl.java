package com.project.gogi.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.gogi.order.dao.OrderDAO;
import com.project.gogi.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDAO dao;

	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception {
		dao.insertNewOrder(myOrderList);
		dao.removeGoodsFromCart(myOrderList);
	}
	
	
}
