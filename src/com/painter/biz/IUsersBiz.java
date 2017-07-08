package com.painter.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.painter.entity.Users;
import com.painter.util.Condition;

public interface IUsersBiz {
	/**
	 * 通过condition传入条件实例，获取用户信息列表
	 * @param condition
	 * @return List<Users>
	 */
	public abstract List<Users> getUsersList(Condition condition); 
	/**
	 * 通过condition传入condition条件获取用户总数
	 * @param condition
	 * @return Integer
	 */
	public abstract int getUsersRecordCount(Condition condition);
	/**
	 * 通过传入的user信息删除指定user用户
	 * @param user
	 * @return Integer
	 */
	public abstract int delUser(Users user);
	
	/**
	 * 通过传入指定user信息，注册user用户
	 * @param user
	 * @return Integer
	 */
	public abstract int reg(Users user);
	
	/**
	 * 通过传入user的name属性,检查是否存在该用户
	 * @param name
	 * @return Users
	 */
	public abstract Users checkName(String name);
	
	/**
	 * 通过传入user对象,进行前台页面的用户登录功能
	 * @param user
	 * @return Users
	 */
	public abstract Users login(Users user);
	
	/**
	 * 通过传入user对象，根据user对象的id属性查询user用户信息
	 * @param user
	 * @return Users
	 */
	public abstract Users findUsersById(Users user);
	
	/**
	 * 通过传入user对象，根据user信息更新用户信息
	 * @param user
	 * @return Integer
	 */
	public abstract int updateUser(Users user);
}
