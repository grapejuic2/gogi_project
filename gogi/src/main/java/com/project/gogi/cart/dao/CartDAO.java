package com.project.gogi.cart.dao;

import org.springframework.dao.DataAccessException;
import com.project.gogi.cart.vo.CartVO;

public interface CartDAO {
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;
}
