package com.project.gogi.cart.service;

import com.project.gogi.cart.vo.CartVO;

public interface CartService {
	public boolean findCartGoods(CartVO cartVO) throws Exception;
	public void addGoodsInCart(CartVO cartVO) throws Exception;
	
}
