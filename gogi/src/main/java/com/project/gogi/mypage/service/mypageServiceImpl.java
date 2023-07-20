package com.project.gogi.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.gogi.mypage.dao.mypageDAO;
import com.project.gogi.mypage.vo.mypageVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class mypageServiceImpl implements mypageService{

	@Autowired
	mypageDAO mypageDAO;
	
	@Override
	public mypageVO modifyMyInfo(Map memberMap) throws Exception {
		 String myp_id=(String)memberMap.get("myp_id");
		 mypageDAO.updateMyInfo(memberMap);
		 return mypageDAO.selectMyDetailInfo(myp_id);
	}

	@Override
	public mypageVO myDetailInfo(String myp_id) throws Exception{
		return mypageDAO.selectMyDetailInfo(myp_id);
	}
}
