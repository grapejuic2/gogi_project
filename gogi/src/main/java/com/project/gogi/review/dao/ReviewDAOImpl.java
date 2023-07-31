package com.project.gogi.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.gogi.review.vo.ReviewVO;

@Repository("ReviewDAO")
public class ReviewDAOImpl implements ReviewDAO{

	//의존성
	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰전체 조회
	@Override
	public List selectAllReviewList(Map pagingMap) throws DataAccessException {
		List<ReviewVO> reviewList = sqlSession.selectList("mapper.review.selectAllReview", pagingMap);
		return reviewList;
	}
			
	// 페이징에 필요한 전체 개수
	@Override
	public int selectTotalReview() throws DataAccessException {
		int totalReview = sqlSession.selectOne("mapper.review.selectTotalReview");
			
		return totalReview;
	}

	//리뷰 작성
	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int rev_id = selectMaxReviewId();
		reviewMap.put("rev_id", rev_id);
		sqlSession.insert("mapper.review.insertNewReview", reviewMap);
		return rev_id;
	}

	private int selectMaxReviewId() throws DataAccessException{
		int review_id =sqlSession.selectOne("mapper.review.selectMaxReviewId");
		return review_id;
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(int rev_no) throws DataAccessException{
		sqlSession.delete("mapper.review.deleteReview", rev_no);
			
	}
}
