package com.painter.biz.impl;

import java.util.List;

import com.painter.biz.ICartBiz;
import com.painter.dao.ICartDao;
import com.painter.entity.Cart;

public class CartBizImpl implements ICartBiz {
	private ICartDao cartDao;
	@Override
	public int delCartByCartid(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.delCartByCartid(cart);
	}
	@Override
	public List<Cart> findCartByUserid(int userid) {
		// TODO Auto-generated method stub
		return cartDao.findCartByUserid(userid);
	}
	@Override
	public int addCart(Cart cart) {
		
		return cartDao.addCart(cart);
	}
	
	@Override
	public int updateCartGoodsnum(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.updateCartGoodsnum(cart);
	}


	@Override
	public Cart findCartByGoodsid(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.findCartByGoodsid(cart);
	}
	
	
	
	
	
	
	
	
	public ICartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(ICartDao cartDao) {
		this.cartDao = cartDao;
	}
	

	





	
}
