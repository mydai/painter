package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.IPainterBiz;
import com.painter.dao.IPainterDao;
import com.painter.entity.Painter;
import com.painter.util.Condition;

public class PainterBizImpl implements IPainterBiz{
	private IPainterDao painterDao;
	@Override
	public List<Painter> findAllPainter() {
		return painterDao.findAllPainter();
	}
	
	@Override
	public List<Painter> getPainterList(Condition condition) {
		return painterDao.findPainterList(condition);
	}

	@Override
	public int getPainterRecordCount(Condition condition) {
		return painterDao.findPainterRecordCount(condition);
	}


	@Override
	public int addPainter(Painter painter) {
		return painterDao.addPainter(painter);
	}


	@Override
	public int deletePainter(Painter painter) {
		return painterDao.delPainterById(painter);
	}
	
	@Override
	public int updatePainter(Painter painter) {
		return painterDao.updatePainterById(painter);
	}
	
	@Override
	public Painter checkName(Painter painter) {
		return painterDao.findPainterByName(painter);
	}
	
	@Override
	public Painter findPainter(Painter painter) {
		return painterDao.findPainterById(painter);
	}
	
	public IPainterDao getPainterDao() {
		return painterDao;
	}

	public void setPainterDao(IPainterDao painterDao) {
		this.painterDao = painterDao;
	}
	
	/**
	 * 画师 
	 */
	@Override
	public Painter login(Painter painter) {
		return painterDao.findPainterByLogin(painter);
	}



}
