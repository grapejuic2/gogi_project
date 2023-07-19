package com.project.gogi.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.gogi.cart.dao.CartDAO;
import com.project.gogi.cart.vo.CartVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServoceImpl implements CartService{
	@Autowired
	CartDAO dao;
	
	@Override
	public boolean findCartGoods(CartVO cartVO) throws Exception {		
		return dao.selectCountInCart(cartVO);
	}

	@Override
	public void addGoodsInCart(CartVO cartVO) throws Exception {
		dao.insertGoodsInCart(cartVO);
	}

}
