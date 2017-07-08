package com.painter.biz.impl;

import java.util.Map;

import com.painter.biz.IAdminsBiz;
import com.painter.dao.IAdminsDao;
import com.painter.entity.Admins;

public class AdminsBizImpl implements IAdminsBiz {

	private IAdminsDao adminsDao;
	@Override
	public Admins login(Admins admins) {
		return adminsDao.findAdmins(admins);
	}
	
	
	@Override
	public int updateAdmins(Map<String, Object> map) {
		return adminsDao.updateAdmins(map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public IAdminsDao getAdminsDao() {
		return adminsDao;
	}
	public void setAdminsDao(IAdminsDao adminsDao) {
		this.adminsDao = adminsDao;
	}
    
}
