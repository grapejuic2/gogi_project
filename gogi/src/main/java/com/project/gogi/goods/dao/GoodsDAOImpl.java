package com.project.gogi.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.goods.vo.GoodsVO;

@Repository("goodsVO")
public class GoodsDAOImpl implements GoodsDAO{
	@Autowired SqlSession sqlSession;
	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList) sqlSession.selectList("mapper.goods.selectGoodsMainList", goodsStatus);
		return goodsList;
	}

}
