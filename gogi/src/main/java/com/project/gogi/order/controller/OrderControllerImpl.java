package com.project.gogi.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.gogi.common.base.BaseController;
import com.project.gogi.member.vo.MemberVO;
import com.project.gogi.order.service.OrderService;
import com.project.gogi.order.vo.OrderVO;


@Controller
@RequestMapping(value="/order")
public class OrderControllerImpl extends BaseController implements OrderController{
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;	

	@Override
	@RequestMapping(value="/orderEachGoods.do", method=RequestMethod.POST)
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("orderEachGoods method called!");
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Boolean isLogOn=(Boolean) session.getAttribute("isLogon"); //로그인 여부
		
		String action=(String) session.getAttribute("action");
		
		//로그인 상태가 아니라면 먼저 로그인후 주문을 처리하도록 주문정보와 주문페이지 요청 URL을 세션에 저장
		if(isLogOn==null || isLogOn==false) {
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action", "/order/orderEachGoods.do");
			return new ModelAndView("redirect:/member/loginForm.do");
		}else {//로그인 후 세션에서 주문정보 가져와 주문창으로 이동
			if(action!=null && action.equals("/order/orderEachGoods.do")) {
				orderVO=(OrderVO) session.getAttribute("orderInfo");
				session.removeAttribute("action");
			}else { //미리 로그인 했다면 바로 주문 처리
				orderVO=_orderVO;
			}
		}
		
		String viewName=(String) request.getAttribute("viewName");
		System.out.println("주문"+viewName);
		ModelAndView mav=new ModelAndView(viewName);
		List myOrderList=new ArrayList<OrderVO>(); //주문정보 저장할 ArrayList 생성
		myOrderList.add(orderVO);//주문정보 저장
		System.out.println("myOrderList: "+myOrderList.toString());
		MemberVO memberInfo=(MemberVO) session.getAttribute("memberInfo");
		session.setAttribute("myOrderList", myOrderList); //주문정보 세션에 바인딩
		session.setAttribute("orderer", memberInfo);//주문자정보 세션에 바인딩
		//로그인 여부 
		mav.addObject("isLogOn", isLogOn);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/payToOrderGoods.do", method=RequestMethod.POST)
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> receiverMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName=(String) request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO) session.getAttribute("orderer");
		String mem_id=memberVO.getMem_id();
		String orderer_name=memberVO.getMem_name();
		String ordere_hp=memberVO.getMem_tel1()+"-"+memberVO.getMem_tel2()+"-"+memberVO.getMem_tel3();
		List<OrderVO> myOrderList=(List<OrderVO>) session.getAttribute("myOrderList");
		
		System.out.println(myOrderList.toString());
		for(int i=0; i<myOrderList.size();i++) {
			OrderVO orderVO=(OrderVO)myOrderList.get(i);
			orderVO.setMem_id(mem_id);
			orderVO.setPay_orderer_hp_num(ordere_hp);
			orderVO.setOrder_rec_name(receiverMap.get("receiver_name"));
			orderVO.setOrder_rec_hp1(receiverMap.get("order_rec_hp1"));
			orderVO.setOrder_rec_hp2(receiverMap.get("order_rec_hp2"));
			orderVO.setOrder_rec_hp3(receiverMap.get("order_rec_hp3"));
			orderVO.setOrder_delivery_address(receiverMap.get("order_delivery_address"));
			orderVO.setOrder_delivery_message(receiverMap.get("order_delivery_message"));
			orderVO.setOrder_delivery_method(receiverMap.get("order_delivery_method"));
			orderVO.setOrder_pay_method(receiverMap.get("order_pay_method"));
			//orderVO.setOrder_delivery_option(receiverMap.get("order_delivery_option"));
			orderVO.setCard_company_name(receiverMap.get("card_company_name"));
			orderVO.setCard_pay_month(receiverMap.get("card_pay_month"));
			orderVO.setPay_orderer_hp_num(receiverMap.get("pay_orderer_hp_num"));
			myOrderList.set(i, orderVO);
		}
		orderService.addNewOrder(myOrderList);
		
		mav.addObject("myOrderInfo", receiverMap);
		mav.addObject("myOrderList", myOrderList);
		
		System.out.println("receiverMap : " + receiverMap.toString());
		System.out.println("myOrderList : " + myOrderList.toString());
		
		
		
		return mav;
	}
}
