package com.project.gogi.goods.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.project.gogi.goods.vo.GoodsVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String goodsStatus) throws DataAccessException;
}
