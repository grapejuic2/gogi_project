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
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.common.base.BaseController;
import com.project.gogi.goods.service.GoodsService;
import com.project.gogi.goods.vo.GoodsVO;
import com.project.gogi.member.controller.MemberController;

@Controller
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController{
	@Autowired
	GoodsService goodsService;
	
	@Override
	@RequestMapping(value = "/shop.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView shop(HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) String category) throws Exception {
	    HttpSession session= request.getSession();
	    session.getAttribute("memberInfo");
	    
	    ModelAndView mav = new ModelAndView();
	    String viewName = (String) request.getAttribute("viewName");
	    mav.setViewName(viewName);

	    
	    Map<String, List<GoodsVO>> goodsMap = goodsService.listShopGoods();

	    // 카테고리에 따라 상품 목록 필터링
	    if (category != null) {
	        goodsMap.keySet().removeIf(key -> !key.equalsIgnoreCase(category));
	    }

	    System.out.println("shop 컨트롤러 " + goodsMap);
	    mav.addObject("goodsMap", goodsMap);
	    return mav;
	}

	@Override
	@RequestMapping(value="/goodsDetail.do", method=RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") int goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("디테일"+goods_id);
		
		String viewName = (String) request.getAttribute("viewName"); 
		HttpSession session= request.getSession();
		System.out.println(session.getAttribute("memberInfo"));
		
		Map goodsMap=goodsService.goodsDetail(goods_id);
		System.out.println("상품디테일 컨트롤러: "+goodsMap);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO) goodsMap.get("goodsVO");
		System.out.println("상품 디테일 컨트롤러 goodsVO: "+goodsVO);
		//addGoodsInQuick(goods_id, goodsVO, session);
		    
		return mav;
	}
	
}
