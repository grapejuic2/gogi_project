package com.project.gogi.serv.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.gogi.serv.domain.CommentVO;
import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.ServImageFileVO;
import com.project.gogi.serv.domain.ServVO;

 
public interface ServDAO {

	 //공지사항 ~
	   //게시물 목록 +페이징
	  public List<ServVO> ServList(Criteria3 cri) throws Exception;
	
	   // 작성
	   public int ServWrite(Map servMap) throws Exception;
	   
	   //이미지 파일 저장
	   public void insertServImageFile(List<ServImageFileVO> fileList) throws DataAccessException;
	   
	   //이미지 파일 조회
	   public List<ServImageFileVO> selectImageFile(int cust_serv_no) throws Exception;
	   
	   // 조회
	   public ServVO ServRead(int cust_serv_no) throws Exception;
	   
	   // 수정  
	   public void ServUpdate(ServVO vo) throws Exception;
	   
	   // 삭제
	   public void ServDelete(int cust_serv_no) throws Exception;
	   
	   
	   //게시물 총 갯수 확인
	    public int ServListCount() throws Exception;

	    
	    //조회수
	    public void updateServViewCnt(int cust_serv_no) throws Exception;
	    
	    //공지사항 끝
 
		public boolean CheckAdmin(ServVO vo)  throws Exception;
		
		public String getServPw(int cust_serv_no) throws Exception;
		
		//1:1문의 내역 조회
		public List<ServVO> selectReviewList(String mem_id) throws Exception;
	    
		 
		public int addComment(CommentVO commentVO) throws DataAccessException;
		      
	    public List<CommentVO> selectBoardCommentByCode(CommentVO commentVO) throws DataAccessException;
		    
}
