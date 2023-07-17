package com.project.gogi.goods.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.project.gogi.goods.vo.GoodsVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goods_status) throws DataAccessException;
	public List<GoodsVO> selectGoodsShopList(String goods_sort) throws DataAccessException;
}
