package com.project.gogi.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.goods.vo.GoodsVO;
import com.project.gogi.goods.vo.ImageFileVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO{
	@Autowired SqlSession sqlSession;
	@Override
	public List<GoodsVO> selectGoodsList(String goods_status) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList) sqlSession.selectList("mapper.goods.selectGoodsMainList", goods_status);
		System.out.println("dao: "+goodsList);
		return goodsList;
	}
	@Override
	public List<GoodsVO> selectGoodsShopList(String goods_sort) throws DataAccessException {
		List<GoodsVO> goodsShopList=(ArrayList) sqlSession.selectList("mapper.goods.selectGoodsShopList", goods_sort);
		System.out.println("dao: "+goodsShopList);
		return goodsShopList;
	}
	@Override
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException {
		GoodsVO goodsVO=sqlSession.selectOne("mapper.goods.selectGoodsDetail", goods_id);
		return goodsVO;
	}
//	@Override
//	public List<ImageFileVO> selectGoodsDetailImage(int goods_id) throws DataAccessException {
//		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",goods_id);
//		return imageList;
//	}

}
