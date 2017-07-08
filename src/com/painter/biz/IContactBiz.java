package com.painter.biz;

import java.util.List;

import com.painter.entity.Contact;
import com.painter.entity.Users;
import com.painter.util.Condition;

public interface IContactBiz {

    /**
     *    添加联系信息
     * @param contact
     * @return Integer
     */
	public abstract List<Contact> getContactList(Condition condition); 
	
    /**
     * ContactDao中的方法，将查询所需条件全部放入condition中，
     * 可以分页查询所有用户的信息列表，可以根据用户名查询单个用户
     * @param map
     * @return
     */
	public abstract int getContactRecordCount(Condition condition);
	
	/**
	 * 获取总信息行数RecordCount,用于分页
	 */
	public abstract int addContact(Contact contact);
}
