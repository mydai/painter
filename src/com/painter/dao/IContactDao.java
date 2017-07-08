package com.painter.dao;

import java.util.List;

import com.painter.entity.Contact;
import com.painter.util.Condition;

public interface IContactDao {
     /**
      *    添加联系信息
      * @param contact
      * @return Integer
      */
	 public abstract int addContact(Contact contact);

	
    /**
     * ContactDao中的方法，将查询所需条件全部放入condition中，
     * 可以分页查询所有用户的信息列表，可以根据用户名查询单个用户
     * @param map
     * @return
     */
	public abstract List<Contact> findContactList(Condition condition); 
	
	/**
	 * 获取总信息行数RecordCount,用于分页
	 */
	public abstract int findContactRecordCount(Condition condition);

}
