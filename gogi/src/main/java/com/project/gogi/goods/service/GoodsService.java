package com.project.gogi.goods.service;

import java.util.List;
import java.util.Map;

import com.project.gogi.goods.vo.GoodsVO;

public interface GoodsService {
	public Map<String, List<GoodsVO>> listMainGoods() throws Exception;
	public Map<String, List<GoodsVO>> listShopGoods() throws Exception;
	public Map goodsDetail(int goods_id) throws Exception;
}
