package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.ICartDao;
import com.painter.entity.Cart;

public class CartDaoImpl implements ICartDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int delCartByCartid(Cart cart) {
		int i = sqlSessionTemplate.delete("com.painter.dao.ICartDao.delCartByCartid", cart);
		return i;
	}

	@Override
	public List<Cart> findCartByUserid(int userid) {
		List<Cart> selectList = sqlSessionTemplate.selectList("com.painter.dao.ICartDao.findCartByUserid", userid);
		return selectList;
	}
	
	@Override
	public int addCart(Cart cart) {
		int res = sqlSessionTemplate.insert("com.painter.dao.ICartDao.addCart",cart);
		return res;
	}
	
	@Override
	public int updateCartGoodsnum(Cart cart) {
		int res=sqlSessionTemplate.update("com.painter.dao.ICartDao.updateCartGoodsnum", cart);
		return 0;
	}


	@Override
	public Cart findCartByGoodsid(Cart cart) {
		Cart c = sqlSessionTemplate.selectOne("com.painter.dao.ICartDao.findCartByGoodsid", cart);
		return c;
	}
	
	
	
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}




}
