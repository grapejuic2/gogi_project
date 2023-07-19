package com.project.gogi.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public String addGoodsInCart(@RequestParam("goods_id") int goods_id, @RequestParam("cart_count") int cart_count, 
			@RequestParam("delivery_option") String delivery_option,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
