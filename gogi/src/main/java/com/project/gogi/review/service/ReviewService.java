package com.project.gogi.review.service;

import java.util.Map;


public interface ReviewService {
	//리뷰 전체조회(페이징)
	public Map listReview(Map pagingMap) throws Exception;

	//리뷰 작성
	public int addNewReview(Map reviewMap) throws Exception;
	
	//리뷰삭제
	public void removeReviewReview(int rev_no) throws Exception;
}
