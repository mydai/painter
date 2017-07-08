package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.IPainterDao;
import com.painter.entity.Contact;
import com.painter.entity.Painter;
import com.painter.entity.Users;
import com.painter.util.Condition;

public class PainterDaoImpl implements IPainterDao {
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Painter> findAllPainter() {
		List<Painter> selectList = sqlSessionTemplate
				.selectList("com.painter.dao.IPainterDao.findAllPainter");
		return selectList;
	}

	@Override
	public List<Painter> findPainterList(Condition condition) {
		List<Painter> list = sqlSessionTemplate.selectList(
				"com.painter.dao.IPainterDao.findPainterList", condition);
		return list;
	}

	@Override
	public int findPainterRecordCount(Condition condition) {
		int count = sqlSessionTemplate
				.selectOne(
						"com.painter.dao.IPainterDao.findPainterRecordCount",
						condition);
		return count;
	}

	@Override
	public int addPainter(Painter painter) {
		int count = sqlSessionTemplate.insert(
				"com.painter.dao.IPainterDao.addPainter", painter);
		return count;
	}

	@Override
	public int delPainterById(Painter painter) {
		int count = sqlSessionTemplate.delete(
				"com.painter.dao.IPainterDao.delPainterById", painter);
		return count;
	}

	@Override
	public int updatePainterById(Painter painter) {
		int count = sqlSessionTemplate.update(
				"com.painter.dao.IPainterDao.updatePainterById", painter);
		return count;
	}

	@Override
	public Painter findPainterById(Painter painter) {
		return sqlSessionTemplate.selectOne(
				"com.painter.dao.IPainterDao.findPainterById", painter);
	}

	@Override
	public Painter findPainterByName(Painter painter) {
		Painter p = null;
		p = sqlSessionTemplate
				.selectOne("com.painter.dao.IPainterDao.findPainterByName");
		return p;
	}

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public Painter findPainterByLogin(Painter painter) {
		Painter p = sqlSessionTemplate.selectOne(
				"com.painter.dao.IPainterDao.findPainterByLogin", painter);
		return p;
	}

}
