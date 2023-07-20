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

import com.project.gogi.mypage.service.mypageService;
import com.project.gogi.mypage.vo.mypageVO;

@Controller("mypageController")
@RequestMapping(value = "/mypage")
public class mypageControllerImpl implements mypageController {

	@Autowired
	private mypageVO mypageVO;
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
	@Override
	@RequestMapping(value = "/modifyMyInfo.do", method = RequestMethod.POST)
	// 수정할 회원 정보 속성을 저장합니다.
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute,
			// 회원 정보의 속성 값을 저장합니다.
			@RequestParam("value") String value, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, String> memberMap = new HashMap<String, String>();
		String val[] = null;
		HttpSession session = request.getSession();
		mypageVO = (mypageVO) session.getAttribute("memberInfo");
		String member_id = mypageVO.getMyp_id();
		if (attribute.equals("member_birth")) {
			val = value.split(",");
			memberMap.put("myp_birth_y", val[0]);
			memberMap.put("myp_birth_m", val[1]);
			memberMap.put("myp_birth_d", val[2]);
			//memberMap.put("member_birth_gn", val[3]);

		} else if (attribute.equals("tel")) {
			val = value.split(",");
			memberMap.put("myp_tel1", val[0]);
			memberMap.put("myp_tel2", val[1]);
			memberMap.put("myp_tel3", val[2]);

		} else if (attribute.equals("hp")) {
			val = value.split(",");
			memberMap.put("myp_hp1", val[0]);
			memberMap.put("myp_hp2", val[1]);
			memberMap.put("myp_hp3", val[2]);
			//memberMap.put("smssts_yn", val[3]);

		} else if (attribute.equals("email")) {
			val = value.split(",");
			memberMap.put("email1", val[0]);
			memberMap.put("email2", val[1]);
			//memberMap.put("emailsts_yn", val[2]);
			
		} else {
			memberMap.put(attribute, value);
		}

		memberMap.put("member_id", member_id);

		// 회원 정보 수정 후 다시 갱신된 회원 정보를 조회합니다.
		mypageVO = (mypageVO) mypageService.modifyMyInfo(memberMap);

		// 세션에 저장된 기존 회원 정보를 삭제한 후 갱신된 회원 정보를 저장합니다.
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", mypageVO);

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
