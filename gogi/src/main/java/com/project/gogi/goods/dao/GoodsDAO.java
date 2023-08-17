package com.project.gogi.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.goods.vo.GoodsVO;
import com.project.gogi.goods.vo.ReviewImageVO;
import com.project.gogi.goods.vo.ReviewVO;


public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goods_status) throws DataAccessException;
	public List<GoodsVO> selectGoodsShopList(String goods_sort) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	//리뷰작성
	public int reviewWrite(ReviewVO reviewVO) throws Exception;	   
	//리뷰이미지 파일 저장
	public void insertReviewImageFile(List<ReviewImageVO> fileList) throws DataAccessException;	   
	//리뷰이미지 파일 조회
	public List<ReviewImageVO> selectImageFile(int rev_no) throws Exception;	   
	public List selectReviewList(int goods_id) throws Exception;
}
