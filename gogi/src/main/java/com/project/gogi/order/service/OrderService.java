package com.project.gogi.order.service;

import java.util.List;

import com.project.gogi.order.vo.OrderVO;

public interface OrderService {
	public  void addNewOrder(List<OrderVO> myOrderList) throws Exception;
}
