package com.project.gogi.cart.controller;

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

import com.project.gogi.cart.service.CartService;
import com.project.gogi.cart.vo.CartVO;
import com.project.gogi.common.base.BaseController;
import com.project.gogi.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	
	@Override
	@RequestMapping(value="/addGoods.do", method=RequestMethod.POST, produces="application/text; charset=utf8")
	//@ResponseBody 어노테이션을 사용하여 컨트롤러 메서드가 반환하는 데이터를 HTTP 응답의 본문(body)으로 직접 전송
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id")int goods_id, @RequestParam("cart_count") int cart_count, 
				@RequestParam("delivery_option") String delivery_option, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		System.out.println("상품아이디:"+goods_id);
		System.out.println("수량"+cart_count);
		System.out.println("배송방법"+delivery_option);
		HttpSession session=request.getSession();
		
		//세션에 저장된 memberInfo 가져와서 cartVO에 mem_id, goods_id,cart_count, delivery_option 저장
		memberVO=(MemberVO) session.getAttribute("memberInfo");
		System.out.println("세션:"+memberVO);
		String mem_id=memberVO.getMem_id();
		System.out.println("멤버아이디"+mem_id);
		
		cartVO.setMem_id(mem_id);
		cartVO.setGoods_id(goods_id);
		cartVO.setCart_count(cart_count);
		cartVO.setDelivery_option(delivery_option);
		
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("cart 존재여부 : "+isAreadyExisted);
		
		if(isAreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	
	@Override
	@RequestMapping(value="/myCartList.do", method=RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName"); 
		ModelAndView mav=new ModelAndView(viewName);
		HttpSession session= request.getSession();
		//System.out.println(session.getAttribute("memberInfo"));
		return mav;
	}

}
