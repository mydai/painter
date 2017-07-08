package com.painter.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.painter.biz.IUsersBiz;
import com.painter.dao.IUsersDao;
import com.painter.entity.Users;
import com.painter.util.Condition;

public class UsersBizImpl implements IUsersBiz{
	private IUsersDao usersDao;
	
	@Override
	public Users login(Users user) {
		
		return usersDao.findUsersByLogin(user);
	}
	@Override
	public int reg(Users user) {
		
		return usersDao.addUsers(user);
	}

	@Override
	public Users checkName(String name) {
		
		return usersDao.findUsersByName(name);
	}
	@Override
	public List<Users> getUsersList(Condition condition) {
		return usersDao.findUsersList(condition);
	}
	
	@Override
	public int getUsersRecordCount(Condition condition) {
		return usersDao.findUsersRecordCount(condition);
	}
	
	@Override
	public int delUser(Users user) {
		return usersDao.delUserById(user);
	}
	
	@Override
	public Users findUsersById(Users user) {
		return usersDao.findUsersById(user);
	}
	
	@Override
	public int updateUser(Users user) {
		return usersDao.updateUserById(user);
	}

	
	public IUsersDao getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(IUsersDao usersDao) {
		this.usersDao = usersDao;
	}



	
}
