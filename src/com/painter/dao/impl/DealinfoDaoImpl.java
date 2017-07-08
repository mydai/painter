package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.IDealinfoDao;
import com.painter.entity.Contact;
import com.painter.entity.Dealinfo;
import com.painter.util.Condition;

public class DealinfoDaoImpl implements IDealinfoDao {
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int addDealinfo(Dealinfo dealinfo) {
		int res = sqlSessionTemplate.insert("com.painter.dao.IDealinfoDao.addDealinfo", dealinfo);
		return res;
	}

	@Override
	public List<Dealinfo> findDealinfoList(Condition condition) {
		List<Dealinfo> list = sqlSessionTemplate.selectList("com.painter.dao.IDealinfoDao.findDealinfoList",condition);
		return list;
	}

	@Override
	public int findDealinfoRecordCount(Condition condition) {
        int count = 0;
        count = sqlSessionTemplate.selectOne("com.painter.dao.IDealinfoDao.findDealinfoRecordCount",condition);
		return count;
	}
	
	
	

	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}



	
	
	
	
}
