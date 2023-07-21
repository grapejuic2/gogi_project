package com.project.gogi.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	@RequestMapping(value="/orderForm.do")
	// 주문창에서 입력한 상품 수령자 정보와 배송지 정보를 Map에 바로 저장합니다.
	public ModelAndView payToOrderGoods(HttpServletRequest request, HttpServletResponse response)  throws Exception{
	String viewName=(String)request.getAttribute("viewName");
	ModelAndView mav = new ModelAndView(viewName);
	return mav;
	}
}
