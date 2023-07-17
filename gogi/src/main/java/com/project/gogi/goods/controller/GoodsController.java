package com.project.gogi.goods.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.goods.service.GoodsService;
import com.project.gogi.goods.vo.GoodsVO;

@Controller
@RequestMapping(value="/goods")
public class GoodsController {
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value = "/shop.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView shop(HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) String category) throws Exception {
	    HttpSession session;
	    ModelAndView mav = new ModelAndView();
	    String viewName = (String) request.getAttribute("viewName");
	    mav.setViewName(viewName);
	    session = request.getSession();
	    Map<String, List<GoodsVO>> goodsMap = goodsService.listShopGoods();

	    // 카테고리에 따라 상품 목록 필터링
	    if (category != null) {
	        goodsMap.keySet().removeIf(key -> !key.equalsIgnoreCase(category));
	    }

	    System.out.println("shop 컨트롤러 " + goodsMap);
	    mav.addObject("goodsMap", goodsMap);
	    return mav;
	}
	
	

	
	
}
