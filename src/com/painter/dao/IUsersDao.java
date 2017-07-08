package com.painter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.painter.entity.Users;
import com.painter.util.Condition;

public interface IUsersDao {
    /**
     * UserDao中的方法，将查询所需条件全部以键值队形式放入mao中，
     * 可以分页查询所有用户的信息列表，可以根据用户名查询单个用户
     * @param map
     * @return
     */
	public abstract List<Users> findUsersList(Condition condition); 
	
	/**
	 * 获取总用户行数RecordCount,用于分页
	 */
	public abstract int findUsersRecordCount(Condition condition);
	

	/**
	 * 根据用户名查询用户
	 */
	public abstract Users findUsersByName(String name);
	/**
	 * 根据用户名和密码查询用户
	 */
	public abstract Users findUsersByLogin(Users user);
	
	/**
	 * 根据用户ID查询该用户所有信息
	 */
	public abstract Users findUsersById(Users user);
	
	/**
	 * 传入User对象，内部封装了所有需要修改的内容,mybatis根据用户ID来修改传入的信息，
	 * 没有传入的信息默认不修改
	 * @param user
	 * @return Integer
	 */
	public abstract int updateUserById(Users user);
	/**
	 * 传入User对象，根据user对象添加用户信息
	 * @param user
	 * @return
	 */
	public int addUsers(Users user);
	

    /**
     * 传入User对象，根据userid删除用户信息
     * @param user
     * @return
     */
	public int delUserById(Users user);
}
