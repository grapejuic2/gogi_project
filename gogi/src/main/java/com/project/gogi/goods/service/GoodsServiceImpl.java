package com.project.gogi.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.gogi.goods.dao.GoodsDAO;
import com.project.gogi.goods.vo.GoodsVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO dao;

	@Override
	public Map<String, List<GoodsVO>> listMainGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap=new HashMap<String, List<GoodsVO>>();
		
		//베스트상품
		List<GoodsVO> goodsList=dao.selectGoodsList("B");
		goodsMap.put("best", goodsList);
		System.out.println("service best"+goodsMap);
		
		//세일상품
		goodsList=dao.selectGoodsList("S");
		goodsMap.put("sale", goodsList);
		System.out.println("service sale"+goodsMap);
		
		
		return goodsMap;
	}

	@Override
	public Map<String, List<GoodsVO>> listShopGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap=new HashMap<String, List<GoodsVO>>();
		List<GoodsVO> goodsList=dao.selectGoodsShopList("PIG");
		goodsMap.put("pig", goodsList);
		
		goodsList=dao.selectGoodsShopList("COW");
		goodsMap.put("cow", goodsList);
		
		goodsList=dao.selectGoodsShopList("CHICKEN");
		goodsMap.put("chicken", goodsList);
		
		goodsList=dao.selectGoodsShopList("MEALKIT");
		goodsMap.put("mealkit", goodsList);
		
		return goodsMap;
	}

}
