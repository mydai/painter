package com.painter.dao.impl;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import com.painter.dao.IUsersDao;
import com.painter.entity.Users;
import com.painter.util.Condition;

public class UsersDaoImpl implements IUsersDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Users findUsersByLogin(Users user) {
		Users u = sqlSessionTemplate.selectOne("com.painter.dao.IUsersDao.findUsersByLogin", user);
		return u;
	}
	
	@Override
	public List<Users> findUsersList(Condition condition) {
		List<Users> list = sqlSessionTemplate.selectList("com.painter.dao.IUsersDao.findUsersList",condition);
		return list;
	}
	
	@Override
	public int findUsersRecordCount(Condition condition) {
        int count = sqlSessionTemplate.selectOne("com.painter.dao.IUsersDao.findUsersRecordCount",condition);
		return count;
	}
	
	@Override
	public int delUserById(Users user) {
        int count = sqlSessionTemplate.delete("com.painter.dao.IUsersDao.delUserById",user);
		return count;
	}
	
	
	@Override
	public int addUsers(Users user) {
		int result = sqlSessionTemplate.insert("com.painter.dao.IUsersDao.addUsers", user);
		return result;
	}
	@Override
	public Users findUsersByName(String name) {
		Users u = sqlSessionTemplate.selectOne("com.painter.dao.IUsersDao.findUsersByName", name);
		return u;
	}
	
	@Override
	public Users findUsersById(Users user) {
		Users u = sqlSessionTemplate.selectOne("com.painter.dao.IUsersDao.findUsersById", user);
		return u;
	}
	
	@Override
	public int updateUserById(Users user) {
		int result = sqlSessionTemplate.update("com.painter.dao.IUsersDao.updateUserById", user);
		return result;
	}
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}





}
