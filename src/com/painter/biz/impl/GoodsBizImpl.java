package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.IGoodsBiz;
import com.painter.dao.IGoodsDao;
import com.painter.entity.Goods;
import com.painter.util.Condition;
import com.painter.util.Page;

public class GoodsBizImpl implements IGoodsBiz {
	private IGoodsDao goodsDao;

	@Override
	public List<Goods> findPageGoodsByTypeid(Page page) {
		return goodsDao.findPageGoodsByTypeid(page);
	}
	@Override
	public List<Goods> findPainterGoods(Condition condition) {
		return goodsDao.findGoodsListByPainterid(condition);
	}
	
	@Override
	public List<Goods> getGoodsList(Condition condition) {
		return goodsDao.findGoodsList(condition);
	}

	@Override
	public int getGoodsRecordCount(Condition condition) {
		return goodsDao.findGoodsRecordCount(condition);
	}

	@Override
	public int addGoods(Goods goods) {
		return goodsDao.addGoods(goods);
	}

	@Override

	public int updateGoods(Goods goods) {
		return goodsDao.updateGoodsById(goods);
	}

	@Override
	public int deleteGoods(Goods goods) {
		return goodsDao.delGoodsById(goods);
	}
	

	public IGoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(IGoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	@Override
	public Goods findGoodsByGoodsid(Goods goods) {
		return goodsDao.findGoodsByGoodsid(goods);
	}
	
	
}
