package com.project.gogi.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.gogi.notice.domain.Criteria;
import com.project.gogi.notice.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	//마이바티스
	@Inject
	private SqlSession sql;

	//매퍼
	private static String namespace = "mapper.notice";
	
	//게시물 목록 +페이징
	 @Override
	 /*
	 public List<NoticeVO> NoticeList(Criteria cri) throws Exception { 
	  
	  return sql.selectList(namespace + ".noticeList",cri);
	 }
	*/
	 public List<NoticeVO> NoticeList( ) throws Exception { 
		  
		  return sql.selectList(namespace + ".noticeList");
		 }
	
	//작성
	@Override
	public void NoticeWrite(NoticeVO vo) throws Exception {
		sql.insert(namespace + ".noticeWrite", vo);
		
	}

	//조회
	@Override
	public NoticeVO NoticeRead(int notice_no) throws Exception {
		return
				 sql.selectOne(namespace + ".noticeRead", notice_no); 
	}

	//수정
	@Override
	public void NoticeUpdate(NoticeVO vo) throws Exception {
		 sql.delete(namespace + ".NoticeUpdate", vo);
		
	}

	//삭제
	@Override
	public void NoticeDelete(int notice_no) throws Exception {
		 sql.delete(namespace + ".NoticeDelete", notice_no);
		
	}
	
	//게시글 총 갯수 확인
	//int 등 타입 확인 잘 하기
	@Override
	public int NoticeListCount() throws Exception {
		return sql.selectOne(namespace+".noticeListCount");
	}
	
	 //조회수
	 @Override	    
	 public void updateNoticeViewCnt(int notice_no) throws Exception {	      
	 	sql.update(namespace + ".updateNoticeViewCnt", notice_no);	   
	 }

	

}
