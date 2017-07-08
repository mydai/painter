package com.painter.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.IAdminsDao;
import com.painter.entity.Admins;

public class AdminsDaoImpl implements IAdminsDao {

	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Admins findAdmins(Admins admins) {
		// 两种方式都可以
		Admins admin = sqlSessionTemplate.selectOne(
				"com.painter.dao.IAdminsDao.findAdmins", admins);
		return admin;
	}

	@Override
	public int updateAdmins(Map<String, Object> map) {
		return sqlSessionTemplate.update(
				"com.painter.dao.IAdminsDao.updateAdmins", map);
	}

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

}
