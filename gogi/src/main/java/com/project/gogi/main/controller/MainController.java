package com.project.gogi.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.goods.service.GoodsService;
import com.project.gogi.goods.vo.GoodsVO;

@Controller("mainController")
@RequestMapping(value="/main")
public class MainController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value= "/main.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{	
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		session=request.getSession();
		//session.setAttribute(name, value); 로그인 했을때 표시되는 메뉴 항목 설정 ( 회원, 관리자 )
		Map<String, List<GoodsVO>> goodsMap=goodsService.listMainGoods();
		mav.addObject("goodsMap", goodsMap);
		System.out.println("controller"+goodsMap);
		return mav;
	}		
}	
