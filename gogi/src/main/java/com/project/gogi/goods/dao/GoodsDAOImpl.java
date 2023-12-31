package com.project.gogi.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.goods.vo.GoodsVO;
import com.project.gogi.goods.vo.ImageFileVO;
import com.project.gogi.goods.vo.ReviewImageVO;
import com.project.gogi.goods.vo.ReviewVO;
import com.project.gogi.serv.domain.ServImageFileVO;

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
	
	@Override
	public int reviewWrite(ReviewVO reviewVO) throws Exception {
		sqlSession.insert("mapper.review.reviewWrite", reviewVO);
		int rev_no=reviewVO.getRev_no();
		return rev_no;
	}
	
	@Override
	public void insertReviewImageFile(List<ReviewImageVO> fileList) throws DataAccessException {
		for(int i=0; i<fileList.size();i++) {
			ReviewImageVO reviewImageVO=(ReviewImageVO) fileList.get(i);
			sqlSession.insert("mapper.review.insertReviewImageFile",reviewImageVO);
		}
	}
	
	@Override
	public List<ReviewImageVO> selectImageFile(int rev_no) throws Exception {
		return sqlSession.selectList("mapper.review.selectImageFile", rev_no);
	}
	

	@Override
	public List selectReviewList(int goods_id) throws Exception {
		List<ReviewVO> reviewList = sqlSession.selectList("mapper.review.reviewList", goods_id);
		return reviewList;
	}

	@Override
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException {
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord",searchWord);
		 return list;
	}

	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		 List<String> list=(ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch",keyword);
		  return list;
	}

}
