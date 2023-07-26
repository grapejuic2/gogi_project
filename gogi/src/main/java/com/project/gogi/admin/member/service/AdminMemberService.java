package com.project.gogi.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.gogi.member.vo.MemberVO;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;
	public MemberVO memberDetail(String member_id) throws Exception;
	public void  modifyMemberInfo(HashMap memberMap) throws Exception;
	public void removeMember(String member_id) throws Exception;
}
