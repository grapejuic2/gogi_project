package com.project.gogi.notice.controller;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gogi.notice.domain.Criteria;
import com.project.gogi.notice.domain.NoticeVO;
import com.project.gogi.notice.domain.PageMaker;
import com.project.gogi.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger =  LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService service;
	
	@Autowired
	private HttpSession httpSession;

/*
	//게시물 목록 +페이징
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String getNoticeList(Model model,Criteria cri) throws Exception {
		
		 List<NoticeVO> NoticeList= null;
		 NoticeList= service.NoticeList(cri);
		 model.addAttribute("NoticeList",NoticeList);
		
		 

		 //게시판 페이징   가져오기.
		 PageMaker pageMaker= new PageMaker();
		 pageMaker.setCri(cri);
		 pageMaker.setTotalCount(service.NoticeListCount());
		 model.addAttribute("pageMaker",pageMaker);
		 
		 return "notice/noticeList";
	}
	
	*/
	
	//게시물 목록  
		@RequestMapping(value = "/list.do", method = RequestMethod.GET)
		public String getNoticeList(Model model) throws Exception {
			
			 List<NoticeVO> noticeList= null;
			 noticeList= service.NoticeList();
			 model.addAttribute("noticeList",noticeList);
		
			 return "notice/noticeList";
		}
	
	
	
	
	//String void 다시 확인해보기
	
	  // 게시물 작성 get
	  @RequestMapping(value = "/write.do", method = RequestMethod.GET) 
	  public String   getNoticeWrite() throws Exception {
	  return "notice/noticeWrite";
	  }
	  
	  
	  // 게시물 작성 post
	  @RequestMapping(value = "/write.do", method = RequestMethod.POST)
	  public String  postNoticeWrite(NoticeVO vo) throws Exception {
		  service.NoticeWrite(vo);
	  //모든 작업을 마치고 목록 화면으로 이동하겠다는 뜻
	  return "redirect:/"; }
	  
	  
		//게시물 조회 + 조회수 중복방지
		@RequestMapping(value = "/read.do", method = RequestMethod.GET)
		public String getView(@RequestParam("notice_no")int notice_no, Model model, NoticeVO vo ) throws Exception {
		 	
			//구분 객체 생성, 세션 값 가져오기 (getAttribute : 세션에서 대이터 가져올때 사용), 저장
			//set : 객체 중복 x
			Set<Integer>  notice_noViewHits=(Set<Integer>) httpSession.getAttribute("notice_noViewHits");

			//초기 notice_noViewHits null일 때 처리 / 값 만들기...
			// hashSet 데이터 중복x , 순서 상관 없음 (하나라 괜츈)
			if (notice_noViewHits == null) {
				notice_noViewHits = new HashSet<>();
				httpSession.setAttribute("notice_noViewHits",notice_noViewHits);
				}
				

			// notice_noViewHits에 들어있지 않은 값일 때 처리하는 로직-최조 클릭 게시물 조회수 +1 증가 후 notice_noViewHits에 해당 notice_no 저장
					if(!notice_noViewHits.contains(notice_no))	{
						service.updateNoticeViewCnt(notice_no);	
						notice_noViewHits.add(notice_no);
					}
			
			//게시물 조회
			vo= service.NoticeRead(notice_no);
			model.addAttribute("noticeRead", vo);
		
			 return "notice/noticeRead";
		}
		
	  
		//게시물 수정
		@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
		public void getModify(@RequestParam("notice_no")int notice_no, Model model) throws Exception{
			NoticeVO vo= service.NoticeRead(notice_no);
			model.addAttribute("noticeRead", vo);
		
		}
		  
	  
	  
	  
	  
	 
	
}
