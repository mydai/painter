package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.IDealinfoBiz;
import com.painter.dao.IDealinfoDao;
import com.painter.entity.Dealinfo;
import com.painter.util.Condition;

public class DealinfoBizImpl implements IDealinfoBiz {
	private IDealinfoDao dealinfoDao;

	@Override
	public int addDealinfo(Dealinfo dealinfo) {
		
		return dealinfoDao.addDealinfo(dealinfo);
	}
	@Override
	public List<Dealinfo> getDealinfoList(Condition condition) {
		return dealinfoDao.findDealinfoList(condition);
	}

	@Override
	public int getDealinfoRecordCount(Condition condition) {
		return dealinfoDao.findDealinfoRecordCount(condition);
	}
	
	
	
	
	
	
	public IDealinfoDao getDealinfoDao() {
		return dealinfoDao;
	}

	public void setDealinfoDao(IDealinfoDao dealinfoDao) {
		this.dealinfoDao = dealinfoDao;
	}

	

	
}
