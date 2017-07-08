package com.painter.dao;

import java.util.Map;
import com.painter.entity.Admins;
public interface IAdminsDao {
    
	/**
	 * 后台管理员的登录方法
	 * @param admins
	 * @return
	 */
	public Admins findAdmins(Admins admins);
	
	/**
	 * 后台管理员密码修改
	 */
	public int updateAdmins(Map<String,Object> map);
}
