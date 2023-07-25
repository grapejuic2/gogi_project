package com.project.gogi.serv.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.ServVO;
 
@Repository
public class ServDAOImpl implements ServDAO {

	//마이바티스
	@Inject
	private SqlSession sql;

	//매퍼
	private static String namespace = "mapper.serv";
	
	//게시물 목록 +페이징
	 @Override
	 public List<ServVO> ServList(Criteria3 cri) throws Exception { 
		  
		  return sql.selectList(namespace + ".servList",cri);
		 }
	
	//작성
	@Override
	public void ServWrite(ServVO vo) throws Exception {
		sql.insert(namespace + ".servWrite", vo);
		
	}

	//조회
	@Override
	public ServVO ServRead(int cust_serv_no) throws Exception {
		
		return
				 sql.selectOne(namespace + ".servRead", cust_serv_no); 
	}

	//수정
	@Override
	public void ServUpdate(ServVO vo) throws Exception {
		
		/*
		 * String result="no"; String db_pwd= (namespace +
		 * ".servGetPw",vo.getCust_serv_no()); if( db_pwd.equals(vo.getCust_serv_pw()))
		 * { result="yes";
		 * 
		 * }
		 * 
		 */
		sql.update(namespace + ".servUpdate", vo);
	}
	
	
	
 
	
	

	//삭제
	@Override
	public void ServDelete(int cust_serv_no) throws Exception {
		 sql.delete(namespace + ".servDelete", cust_serv_no);
		
	}
	
	//게시글 총 갯수 확인
	//int 등 타입 확인 잘 하기
	@Override
	public int ServListCount() throws Exception {
		return sql.selectOne(namespace+".servListCount");
	}
	
	 //조회수
	 @Override	    
	 public void updateServViewCnt(int cust_serv_no) throws Exception {	      
	 	sql.update(namespace + ".updateServViewCnt", cust_serv_no);	   
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
		
		
