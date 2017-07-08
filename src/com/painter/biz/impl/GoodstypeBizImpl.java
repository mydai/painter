package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.IGoodstypeBiz;
import com.painter.dao.IGoodstypeDao;
import com.painter.dao.impl.GoodstypeDaoImpl;
import com.painter.entity.Goodstype;

public class GoodstypeBizImpl implements IGoodstypeBiz {
	private	IGoodstypeDao  goodstypeDao;

	@Override
	public List<Goodstype> findALLGoodstype() {
		 
		return goodstypeDao.findALLGoodstype();
	}
	
	
	
	
	
	public IGoodstypeDao getGoodstypeDao() {
		return goodstypeDao;
	}

	public void setGoodstypeDao(IGoodstypeDao goodstypeDao) {
		this.goodstypeDao = goodstypeDao;
	}

	
	
}
