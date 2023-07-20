package com.project.gogi.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.mypage.service.mypageService;
import com.project.gogi.mypage.vo.mypageVO;

@Controller("mypageController")
@RequestMapping(value = "/mypage")
public class mypageControllerImpl implements mypageController {
	
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private mypageService mypageService;

	// 회원 정보
	@Override
	@RequestMapping(value = "/myDetailInfo.do", method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	// 회원 정보 수정
	// 수정할 회원 정보 속성을 저장합니다.
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
									   // 수정할 회원 정보 속성을 저장합니다.
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute,
									   // 회원 정보의 속성 값을 저장합니다.
			                 		   @RequestParam("value")  String value,
			                 		   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String mem_id = memberVO.getMem_id();
		String mem_name = memberVO.getMem_name();
		String mem_email = memberVO.getMem_email();
		
		if (attribute.equals("mem_birth")) {
			val = value.split(",");
			memberMap.put("mem_birth_y", val[0]);
			memberMap.put("mem_birth_m", val[1]);
			memberMap.put("mem_birth_d", val[2]);
			// memberMap.put("member_birth_gn", val[3]);

		} else if (attribute.equals("mem_tel")) {
			val = value.split(",");
			memberMap.put("mem_tel1", val[0]);
			memberMap.put("mem_tel2", val[1]);
			memberMap.put("mem_tel3", val[2]);

		} else if (attribute.equals("mem_email")) {
			val = value.split(",");
			memberMap.put("mem_email", val[0]);
			// memberMap.put("emailsts_yn", val[2]);
		} else {
			memberMap.put(attribute, value);
		}

		memberMap.put("mem_id", mem_id);
		memberMap.put("mem_name", mem_name);
		memberMap.put("mem_email", mem_email);

		// 회원 정보 수정 후 다시 갱신된 회원 정보를 조회합니다.
		memberVO = (MemberVO) mypageService.modifyMyInfo(memberMap);

		// 세션에 저장된 기존 회원 정보를 삭제한 후 갱신된 회원 정보를 저장합니다.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	// /mypage/*Form.do 처리
	@RequestMapping(value = "/*Form.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action,
			@RequestParam(value = "goods_id", required = false) String goods_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		if (goods_id != null) {
			session.setAttribute("goods_id", goods_id);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

}
