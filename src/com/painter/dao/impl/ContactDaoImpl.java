package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import com.painter.dao.IContactDao;

import com.painter.entity.Contact;

import com.painter.entity.Contact;
import com.painter.util.Condition;


public class ContactDaoImpl implements IContactDao {
	private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public int addContact(Contact contact) {
		int result = sqlSessionTemplate.insert("com.painter.dao.IContactDao.addContact", contact);
		return result;
	}
	

	@Override
	public List<Contact> findContactList(Condition condition) {
		List<Contact> list = sqlSessionTemplate.selectList("com.painter.dao.IContactDao.findContactList",condition);
		return list;
	}


	@Override
	public int findContactRecordCount(Condition condition) {
        int count = sqlSessionTemplate.selectOne("com.painter.dao.IContactDao.findContactRecordCount",condition);
		return count;
	}

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}





	
	
}
