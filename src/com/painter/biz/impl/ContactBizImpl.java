package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.IContactBiz;
import com.painter.dao.IContactDao;
import com.painter.entity.Contact;
import com.painter.util.Condition;

public class ContactBizImpl implements IContactBiz {
	private IContactDao contactDao;
    
	@Override
	public int addContact(Contact contact) {
		
		return contactDao.addContact(contact);
	}
	@Override
	public List<Contact> getContactList(Condition condition) {
		return contactDao.findContactList(condition);
	}

	@Override
	public int getContactRecordCount(Condition condition) {
		return contactDao.findContactRecordCount(condition);
	}
	
	public IContactDao getContactDao() {
		return contactDao;
	}

	public void setContactDao(IContactDao contactDao) {
		this.contactDao = contactDao;
	}

	


	
}
