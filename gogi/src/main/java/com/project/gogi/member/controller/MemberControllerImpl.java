package com.project.gogi.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.common.base.BaseController;
import com.project.gogi.member.service.MemberService;
import com.project.gogi.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberVO memberVO;
	
	
	@Override
	@RequestMapping(value =  "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		memberVO = memberService.login(loginMap);
		if(memberVO!= null && memberVO.getMem_id()!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("isLogon", true);
			session.setAttribute("memberInfo", memberVO);
			
			String action = (String)session.getAttribute("action");
			
			if(action != null) {
				if(action.equals("/order/orderEachGoods.do")){
					mav.setViewName("forward:"+action);
				}else if(action.equals("/board/review/reviewForm.do")){
					mav.setViewName("redirect:" + action);
				}else if(action.equals("/board/qna/qnaForm.do")){
					mav.setViewName("redirect:" + action);
				}else if(action.equals("/goods/goodsDetail.do")) {
					mav.setViewName("forward:" + action);
				}
				
			} else { // action 값이 null인경우 main으로 넘김
					System.out.println(memberVO.getMem_id()+ " 로그인 완료");
					mav.setViewName("redirect:/main/main.do");
			}
			
		}else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm.do");
		}
		return mav;
	}
	
	// 로그아웃 사용 시 컨트롤러
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	// 회원가입 사용 시 컨트롤러
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
									// 회원 가입 창에서 전송된 회원 정보를 _memberVO에 설정합니다.
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                		HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			// 회원 정보를 SQL문으로 전달합니다.
		    memberService.insertNewMember(_memberVO);
		    
		    message  = "<script>";
		    message +=" alert('회원 가입이 완료됐습니다! 로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	// 아이디 중복 검사 시 실행
	@Override
	@RequestMapping(value="/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,
									 HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id); // ID 중복 검사를 합니다.
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	// member/*Form.do 일괄처리 메서드 
	@RequestMapping(value = "/*Form.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,
							 @RequestParam(value = "action", required = false) String action,
							 @RequestParam(value = "goods_id", required = false) String goods_id,
							 HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		if(goods_id != null) {
			session.setAttribute("goods_id", goods_id);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}
	
}