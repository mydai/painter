package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.IGoodstypeDao;
import com.painter.entity.Goodstype;

public class GoodstypeDaoImpl implements IGoodstypeDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<Goodstype> findALLGoodstype() {
		List<Goodstype> typelist = sqlSessionTemplate.selectList("com.painter.dao.IGoodstypeDao.findALLGoodstype");
		return typelist;
	}
	
	
	
	
	
	
	
	
	
	

	
}
