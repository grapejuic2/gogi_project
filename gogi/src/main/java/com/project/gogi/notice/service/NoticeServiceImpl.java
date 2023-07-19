package com.project.gogi.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.project.gogi.notice.dao.NoticeDAO;
import com.project.gogi.notice.domain.Criteria;
import com.project.gogi.notice.domain.NoticeVO;

@Repository
public class NoticeServiceImpl implements NoticeService {

	@Inject 
	private NoticeDAO dao;

	//게시물 목록 +페이징
	@Override
	/*
	 * public List<NoticeVO> NoticeList(Criteria cri) throws Exception{ return
	 * dao.NoticeList(cri); }
	 */

	public List<NoticeVO> NoticeList( ) throws Exception{
		return dao.NoticeList( );
	}
	
	//작성
	@Override
	public void NoticeWrite(NoticeVO vo) throws Exception {
		dao.NoticeWrite(vo);
		
	}

	//조회
	@Override
	public NoticeVO NoticeRead(int notice_no) throws Exception {
		return dao.NoticeRead(notice_no);
	}

	//수정
	@Override
	public void NoticeUpdate(NoticeVO vo) throws Exception {
		dao.NoticeUpdate(vo);
	}

	
	//삭제
	@Override
	public void NoticeDelete(int notice_no) throws Exception {
		dao.NoticeDelete(notice_no);
	}
	
	// 게시물 총 갯수
	@Override
	public int NoticeListCount() throws Exception {
	 return dao.NoticeListCount();
	}
	
	 //조회수
	 @Override	    
	 public void updateNoticeViewCnt(int notice_no) throws Exception {	      
	 	dao. updateNoticeViewCnt(notice_no);	   
	 }
	
}
