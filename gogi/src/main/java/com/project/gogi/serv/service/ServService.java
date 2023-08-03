package com.project.gogi.serv.service;

import java.util.List;
import java.util.Map;

import com.project.gogi.serv.domain.CommentVO;
import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.ServVO;
 

public interface ServService {

   //게시물 목록 +페이징
   public List<ServVO>ServList(Criteria3 cri) throws Exception;
	 
   // 작성
   public int ServWrite(Map servMap) throws Exception;
   
   // 조회
   public Map<String, Object> ServRead(int cust_serv_no) throws Exception;
   
   // 수정
   public void ServUpdate(ServVO vo) throws Exception;
	   
	// 삭제
	public void ServDelete(int cust_serv_no) throws Exception;
	   
	// 게시물 총 갯수
	public int ServListCount() throws Exception;
		
	//조회수
	public void updateServViewCnt(int cust_serv_no) throws Exception;
 

	public boolean CheckAdmin(ServVO vo) throws Exception;
				 
				 
	public String getServPw(int cust_serv_no) throws Exception;
		  
	//1:1문의내역 조회
	public List<ServVO> reviewList(String mem_id) throws Exception;
		  
	//고객센터 댓글 추가
	public void addComment(CommentVO commentVO) throws Exception;
	
	//고객센터 댓글 리스트 조회
	public List<CommentVO> selectBoardCommentByCode(CommentVO commentVO) throws Exception;

	void addReply(CommentVO commentVO) throws Exception;
	

}
