package com.project.gogi.notice.dao;

import java.util.List;

import com.project.gogi.notice.domain.Criteria;
import com.project.gogi.notice.domain.NoticeVO;

public interface NoticeDAO {

	 
	   //게시물 목록 +페이징
	/* public List<NoticeVO> NoticeList(Criteria cri) throws Exception; */ 
	  public List<NoticeVO> NoticeList() throws Exception;
	
	   // 작성
	   public void NoticeWrite(NoticeVO vo) throws Exception;
	   
	   // 조회
	   public NoticeVO NoticeRead(int notice_no) throws Exception;
	   
	   // 수정
	   public void NoticeUpdate(NoticeVO vo) throws Exception;
	   
	   // 삭제
	   public void NoticeDelete(int notice_no) throws Exception;
	   
	   
	   //게시물 총 갯수 확인
	    public int NoticeListCount() throws Exception;

	    
	    //조회수
	    public void updateNoticeViewCnt(int bno) throws Exception;


}
