package com.project.gogi.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.gogi.review.dao.ReviewDAO;
import com.project.gogi.review.vo.ReviewVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{

	//의존성
	@Autowired
	private ReviewDAO boardReviewDAO;
	
	// 리뷰 전체조회(페이징)
	@Override
	public Map listReview(Map pagingMap) throws Exception {
		Map reviewMap = new HashMap();
		List<ReviewVO> reviewList = boardReviewDAO.selectAllReviewList(pagingMap);
			
		// 모든 글 수
		int totalReview = boardReviewDAO.selectTotalReview();
			
		reviewMap.put("reviewList", reviewList);
		reviewMap.put("totalReview", totalReview);
			
		return reviewMap;
	}

	//리뷰 작성
	@Override
	public int addNewReview(Map reviewMap) throws Exception {
		return boardReviewDAO.insertNewReview(reviewMap);
	}

	//리뷰 삭제
	@Override
	public void removeReviewReview(int rev_no) throws Exception {
		boardReviewDAO.deleteReview(rev_no);
	}

}
