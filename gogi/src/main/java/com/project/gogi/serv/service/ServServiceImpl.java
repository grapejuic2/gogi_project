package com.project.gogi.serv.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.serv.dao.ServDAO;
import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.ServVO;


@Repository
@Service
public class ServServiceImpl implements ServService {

	@Inject 
	private ServDAO dao;

	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ServVO ServVO;
	
	//게시물 목록 +페이징
	@Override
	public List<ServVO> ServList(Criteria3 cri) throws Exception{
		return dao.ServList(cri);
	}
	
	//작성
	@Override
	public void ServWrite(ServVO vo) throws Exception {
		dao.ServWrite(vo);
		
	}

	//조회
	@Override
	public ServVO ServRead(int cust_serv_no) throws Exception {
		return dao.ServRead(cust_serv_no);
	}

	//수정
	@Override
	public void ServUpdate(ServVO vo) throws Exception {
		dao.ServUpdate(vo);
	}

	
	//삭제
	@Override
	public void ServDelete(int cust_serv_no) throws Exception {
		dao.ServDelete(cust_serv_no);
	}
	
	// 게시물 총 갯수
	@Override
	public int ServListCount() throws Exception {
	 return dao.ServListCount();
	}
	
	 //조회수
	 @Override	    
	 public void updateServViewCnt(int cust_serv_no) throws Exception {	      
	 	dao. updateServViewCnt(cust_serv_no);	   
	 }
	 
	 

		 
			
			@Override
			 // admin 확인 메서드 추가
		    public boolean CheckAdmin(ServVO vo) {
		        // vo를 사용하여 "mem_id"를 가져오거나 필요한 로직을 추가합니다.
		        String mem_id = vo.getMem_id();

		        // mem_id가 "admin"인지 확인하여 true 또는 false를 반환합니다.
		        return "admin".equals(mem_id);
		    }
			
			
			
			
			
	
}
