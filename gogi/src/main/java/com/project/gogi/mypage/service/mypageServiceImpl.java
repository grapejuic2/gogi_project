package com.project.gogi.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.dao.mypageDAO;
import com.project.gogi.mypage.vo.mypageVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class mypageServiceImpl implements mypageService{

	@Autowired
	mypageDAO mypageDAO;
	
	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		 String mem_id=(String)memberMap.get("mem_id");
		 mypageDAO.updateMyInfo(memberMap);
		 return mypageDAO.selectMyDetailInfo(mem_id);
	}

	@Override
	public MemberVO myDetailInfo(String mem_id) throws Exception{
		return mypageDAO.selectMyDetailInfo(mem_id);
	}
	
	//비밀번호 검사
	@Override
	public String checkpw(String pw) throws Exception{
		return mypageDAO.checkpw(pw);
	}
}
