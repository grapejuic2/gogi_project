package com.project.gogi.serv.controller;


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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.serv.domain.Criteria3;
import com.project.gogi.serv.domain.PageMaker3;
import com.project.gogi.serv.domain.ServVO;
import com.project.gogi.serv.service.ServService; 

@Controller
@RequestMapping("/serv")
public class ServController {

	private static final Logger logger =  LoggerFactory.getLogger(ServController.class);
	
	@Inject
	ServService service;
	
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private ServVO servVO;
	@Autowired
	private MemberVO memberVO;


	//공지사항~
	//게시물 목록  +페이징
		@RequestMapping(value = "/list.do", method = RequestMethod.GET)
		public String getServList(Model model,Criteria3 cri, HttpServletRequest request, HttpServletResponse response,ServVO vo) throws Exception {
  
			logger.info("리스트 페이지 가져오기");
			 
			 	 List<ServVO> servList= new ArrayList<ServVO>();
					 servList= service.ServList(cri);
					 model.addAttribute("servList",servList);

					 
					 //게시판 페이징   가져오기.
					 PageMaker3 pageMaker= new PageMaker3();
					 pageMaker.setCri(cri);
					 pageMaker.setTotalCount(service.ServListCount());
					 model.addAttribute("pageMaker3",pageMaker); 
			        return "serv/servList";
		 
		}
		
 
	
	  // 게시물 작성 get
	  @RequestMapping(value = "/write.do", method = RequestMethod.GET) 
	  public String   getServWrite() throws Exception {
	  return "serv/servWrite";
	  }
	  
	  
	  // 게시물 작성 post
	  @RequestMapping(value = "/write.do", method = RequestMethod.POST)
	  public String  postServWrite(ServVO vo) throws Exception {
		  service.ServWrite(vo);
	  //모든 작업을 마치고 목록 화면으로 이동하겠다는 뜻
	  return "redirect:/serv/list.do"; }
	  
	  
		//게시물 조회 + 조회수 중복방지
		@RequestMapping(value = "/read.do", method = RequestMethod.GET)
		public String getServView(@RequestParam("cust_serv_no")int cust_serv_no, Model model, ServVO vo ) throws Exception {
		 	
			//구분 객체 생성, 세션 값 가져오기 (getAttribute : 세션에서 대이터 가져올때 사용), 저장
			//set : 객체 중복 x
			Set<Integer>  serv_noViewHits=(Set<Integer>) httpSession.getAttribute("serv_noViewHits");

			//초기 notice_noViewHits null일 때 처리 / 값 만들기...
			// hashSet 데이터 중복x , 순서 상관 없음 (하나라 괜츈)
			if (serv_noViewHits == null) {
				serv_noViewHits = new HashSet<>();
				httpSession.setAttribute("serv_noViewHits",serv_noViewHits);
				}
				

			// notice_noViewHits에 들어있지 않은 값일 때 처리하는 로직-최조 클릭 게시물 조회수 +1 증가 후 notice_noViewHits에 해당 notice_no 저장
					if(!serv_noViewHits.contains(cust_serv_no))	{
						service.updateServViewCnt(cust_serv_no);	
						serv_noViewHits.add(cust_serv_no);
					}
			
			//게시물 조회
			vo= service.ServRead(cust_serv_no);
			model.addAttribute("servRead", vo);
		
			 return "serv/servRead";
		}
		
	  
		
		
		// 게시물 삭제
		@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
		public String getServDelete(@RequestParam("cust_serv_no") int cust_serv_no) throws Exception {
		  
		 service.ServDelete(cust_serv_no);  
		 return "redirect:/serv/list.do";
		}
		
		
 
		
		
		// 게시물 수정 페이지 이동
		@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
		public String getServModify(@RequestParam("cust_serv_no") int cust_serv_no, Model model) throws Exception {
		    ServVO vo = service.ServRead(cust_serv_no);
		    model.addAttribute("servRead", vo);
		    return "serv/servModify";
		}

		 // 게시물 수정 처리
	    @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	    @ResponseBody
	    public Map<String, Object> postServModify(ServVO vo) throws Exception {
	        Map<String, Object> result = new HashMap<>();
	        
	        ServVO servFromDB = service.ServRead(vo.getCust_serv_no());
	        String enteredPassword = vo.getCust_serv_pw();

	        if (servFromDB == null) {
	            result.put("success", false);
	            result.put("message", "해당 게시물을 찾을 수 없습니다.");
	            return result;
	        }

	        String storedPassword = servFromDB.getCust_serv_pw();

	        if (storedPassword.equals(enteredPassword)) {
	            service.ServUpdate(vo);
	            result.put("success", true);
	            result.put("message", "게시물이 수정되었습니다.");
	        } else {
	            result.put("success", false);
	            result.put("message", "일치하지 않는 비밀번호입니다.");
	        }

	        return result;
	    }
		    
		 
	 
				}	 
	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		 
