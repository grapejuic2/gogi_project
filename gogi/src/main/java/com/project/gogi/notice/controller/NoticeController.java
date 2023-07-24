package com.project.gogi.notice.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.notice.domain.Criteria;
import com.project.gogi.notice.domain.Criteria2;
import com.project.gogi.notice.domain.NoticeVO;
import com.project.gogi.notice.domain.PageMaker;
import com.project.gogi.notice.domain.PageMaker2;
import com.project.gogi.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger =  LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService service;
	
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private NoticeVO noticeVO;
	@Autowired
	private MemberVO memberVO;


	//공지사항~
	//게시물 목록  +페이징
		@RequestMapping(value = "/list.do", method = RequestMethod.GET)
		public String getNoticeList(Model model,Criteria cri,Criteria2 cri2, HttpServletRequest request, HttpServletResponse response,NoticeVO vo) throws Exception {
			
			 request.getSession();
			    memberVO = (MemberVO) httpSession.getAttribute("memberInfo");
			    String mem_id = null;

		        // 로그인 상태 확인
		        if (memberVO != null) {
		            mem_id = memberVO.getMem_id();
		        }
		       
		        if (mem_id == null) {
		        	service.NoticeList(cri);
		        }
			   
			    
			    vo.setMem_id(mem_id);

			    Boolean noticeAdmin = service.CheckAdmin(vo);
			    System.out.println("관리자 확인:" +mem_id);

			    if (noticeAdmin == true) {
			        // "admin"인 경우, noticeListAdmin.jsp로 리다이렉트.
					 List<NoticeVO> noticeList= new ArrayList<NoticeVO>();
					 vo.setMem_id(mem_id);
					 noticeList= service.NoticeList(cri);
					 
					 model.addAttribute("noticeList",noticeList);

					 
					 //게시판 페이징   가져오기.
					 PageMaker pageMaker= new PageMaker();
					 pageMaker.setCri(cri);
					 pageMaker.setTotalCount(service.NoticeListCount());
					 model.addAttribute("pageMaker",pageMaker);
		 
			 
					 //게시판 페이징   가져오기.
					 PageMaker2 pageMaker2= new PageMaker2();
					 pageMaker2.setCri(cri);
					 pageMaker2.setTotalCount(service.NoticeFAQListCount());
					 model.addAttribute("pageMaker2",pageMaker2);
		 
				
				  //동림언니 페이징
				  
				  String _section=request.getParameter("section"); String
				  _pageNum=request.getParameter("pageNum");
				  
				  
				  //초기값 설정
				  int section=Integer.parseInt(((_section==null) ? "1" : _section));
				  int pageNum=Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
				  
				  Map<String, Object> paging = new HashMap<>(); paging.put("section", section);
				  paging.put("pageNum", pageNum);
				  
				  
				  
				  List<NoticeVO> noticeFAQList= null; noticeFAQList= service.listBoard(paging);
				  
				  int total=service.boardCount();
				  
				  model.addAttribute("section", section); 
				  model.addAttribute("pageNum",  pageNum);
				  model.addAttribute("noticeFAQList",noticeFAQList);
				  model.addAttribute("totalBoard",total);
				 
					 
					 
			        return "notice/noticeListAdmin";
			     
			    }  
			    
			    else {
			 	 List<NoticeVO> noticeList= new ArrayList<NoticeVO>();
					 noticeVO.setMem_id(mem_id);
					 noticeList= service.NoticeList(cri);
					 model.addAttribute("noticeList",noticeList);

					 
					 //게시판 페이징   가져오기.
					 PageMaker pageMaker= new PageMaker();
					 pageMaker.setCri(cri);
					 pageMaker.setTotalCount(service.NoticeListCount());
					 model.addAttribute("pageMaker",pageMaker);
		 
					  
					 
					 //faq
						
//					 List<NoticeVO> noticeFAQList= null;
//					 noticeFAQList= service.NoticeFAQList(cri2);
//					 model.addAttribute("noticeFAQList",noticeFAQList);

					 
					 //게시판 페이징   가져오기.
					 PageMaker2 pageMaker2= new PageMaker2();
					 pageMaker2.setCri(cri);
					 pageMaker2.setTotalCount(service.NoticeFAQListCount());
					 model.addAttribute("pageMaker2",pageMaker2);
		 
				
				  //동림언니 페이징
				  
				  String _section=request.getParameter("section"); String
				  _pageNum=request.getParameter("pageNum");
				  
				  
				  //초기값 설정
				  int section=Integer.parseInt(((_section==null) ? "1" : _section));
				  int pageNum=Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
				  
				  Map<String, Object> paging = new HashMap<>(); paging.put("section", section);
				  paging.put("pageNum", pageNum);
				  
				  
				  
				  List<NoticeVO> noticeFAQList= null; noticeFAQList= service.listBoard(paging);
				  
				  int total=service.boardCount();
				  
				  model.addAttribute("section", section); 
				  model.addAttribute("pageNum",  pageNum);
				  model.addAttribute("noticeFAQList",noticeFAQList);
				  model.addAttribute("totalBoard",total);
				 
					 
					 
			        return "notice/noticeList";
			    }
			    
			    
			    
			    
			 

			 
			
		}
		
		

		
		
	/*
	 * @RequestMapping(value = "/faqlist.do", method = RequestMethod.GET) public
	 * void getNoticeFAQList(Model model,Criteria cri,Criteria2 cri2,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * 
	 * request.getSession();
	 * 
	 * memberVO=(MemberVO) httpSession.getAttribute("memberInfo"); String
	 * mem_id=memberVO.getMem_id(); System.out.println(mem_id);
	 * 
	 * 
	 * 
	 * //동림언니 페이징
	 * 
	 * String _section=request.getParameter("section"); String
	 * _pageNum=request.getParameter("pageNum");
	 * 
	 * 
	 * //초기값 설정 int section=Integer.parseInt(((_section==null) ? "1" : _section));
	 * int pageNum=Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
	 * 
	 * Map<String, Object> paging = new HashMap<>(); paging.put("section", section);
	 * paging.put("pageNum", pageNum);
	 * 
	 * 
	 * 
	 * List<NoticeVO> noticeFAQList= service.listBoard(paging);
	 * System.out.println(noticeFAQList);
	 * 
	 * int total=service.boardCount();
	 * 
	 * model.addAttribute("section", section); model.addAttribute("pageNum",
	 * pageNum); model.addAttribute("noticeFAQList",noticeFAQList);
	 * model.addAttribute("totalBoard",total);
	 * 
	 * 
	 * 
	 * }
	 */
	
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
	  return "redirect:/notice/list.do"; }
	  
	  
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
		public String getModify(@RequestParam("notice_no")int notice_no, Model model) throws Exception{
			NoticeVO vo= service.NoticeRead(notice_no);
			model.addAttribute("noticeRead", vo);
		
			return "notice/noticeModify";
		}
		

		// 게시물 수정
		@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
		public String postModify(NoticeVO vo) throws Exception {

			service.NoticeUpdate(vo);
	
			//redirect는 value 경로 넣어주기..꼭!!!!!!
		 return "redirect:/notice/read.do?notice_no=" + vo.getNotice_no();
		}
		  
	  
		// 게시물 삭제
		@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
		public String getDelete(@RequestParam("notice_no") int notice_no) throws Exception {
		  
		 service.NoticeDelete(notice_no);  
		 return "redirect:/notice/list.do";
		}
		
		
	  //FAQ~
	
			
			//String void 다시 확인해보기
			
			  // 게시물 작성 get
			  @RequestMapping(value = "/faqwrite.do", method = RequestMethod.GET) 
			  public String   getNoticeFAQWrite() throws Exception {
			  return "notice/noticeFAQWrite";
			  }
			  
			  
			  // 게시물 작성 post
			  @RequestMapping(value = "/faqwrite.do", method = RequestMethod.POST)
			  public String  postNoticeFAQWrite(NoticeVO vo) throws Exception {
				  service.NoticeFAQWrite(vo);
			  //모든 작업을 마치고 목록 화면으로 이동하겠다는 뜻
			  return "redirect:/notice/list.do"; }
			  
			  
				//게시물 조회 + 조회수 중복방지
				@RequestMapping(value = "/faqread.do", method = RequestMethod.GET)
				public String getFAQView(@RequestParam("notice_no_faq")int notice_no_faq, Model model, NoticeVO vo ) throws Exception {
				 	
					//구분 객체 생성, 세션 값 가져오기 (getAttribute : 세션에서 대이터 가져올때 사용), 저장
					//set : 객체 중복 x
					Set<Integer>  notice_no_faqViewHits=(Set<Integer>) httpSession.getAttribute("notice_no_faqViewHits");

					//초기 notice_noViewHits null일 때 처리 / 값 만들기...
					// hashSet 데이터 중복x , 순서 상관 없음 (하나라 괜츈)
					if (notice_no_faqViewHits == null) {
						notice_no_faqViewHits = new HashSet<>();
						httpSession.setAttribute("notice_no_faqViewHits",notice_no_faqViewHits);
						}
						

					// notice_noViewHits에 들어있지 않은 값일 때 처리하는 로직-최조 클릭 게시물 조회수 +1 증가 후 notice_noViewHits에 해당 notice_no 저장
							if(!notice_no_faqViewHits.contains(notice_no_faq))	{
								service.updateNoticeFAQViewCnt(notice_no_faq);	
								notice_no_faqViewHits.add(notice_no_faq);
							}
					
					//게시물 조회
					vo= service.NoticeFAQRead(notice_no_faq);
					model.addAttribute("noticeFAQRead", vo);
				
					 return "notice/noticeFAQRead";
				}
				
			  
				//게시물 수정
				@RequestMapping(value = "/faqmodify.do", method = RequestMethod.GET)
				public String getFAQModify(@RequestParam("notice_no_faq")int notice_no_faq, Model model) throws Exception{
					NoticeVO vo= service.NoticeFAQRead(notice_no_faq);
					model.addAttribute("noticeFAQRead", vo);
				
					return "notice/noticeFAQModify";
				}
				

				// 게시물 수정
				@RequestMapping(value = "/faqmodify.do", method = RequestMethod.POST)
				public String postFAQModify(NoticeVO vo) throws Exception {

					service.NoticeFAQUpdate(vo);
			
					//redirect는 value 경로 넣어주기..꼭!!!!!!
				 return "redirect:/notice/faqread.do?notice_no=" + vo.getNotice_no_faq();
				}
				  
			  
				// 게시물 삭제
				@RequestMapping(value = "/faqdelete.do", method = RequestMethod.GET)
				public String getFAQDelete(@RequestParam("notice_no_faq") int notice_no_faq) throws Exception {
				  
				 service.NoticeFAQDelete(notice_no_faq);  
				 return "redirect:/notice/list.do";
				}
		
	  
				}	 
	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		 
