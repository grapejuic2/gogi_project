package com.project.gogi.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.cart.vo.CartVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result=sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);	
		return Boolean.parseBoolean(result);
	}

	@Override
	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException {
		int cart_no=selectMaxCartNo();
		cartVO.setCart_no(cart_no);
		sqlSession.insert("mapper.cart.insertGoodsInCart", cartVO);
	}
	
	private int selectMaxCartNo() throws DataAccessException{
		int cart_no = sqlSession.selectOne("mapper.cart.selectMaxCartNo");
		return cart_no;
	}
	
	

}
