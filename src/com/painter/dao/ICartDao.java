package com.painter.dao;

import java.util.List;

import com.painter.entity.Cart;


public interface ICartDao {
	/**
	 * 添加商品到购物车
	 * @param cart
	 * @return
	 */
	public abstract int addCart(Cart cart);
	/**
	 * 更改购物车的商品数量
	 * @param cart
	 * @return
	 */
	public abstract int updateCartGoodsnum(Cart cart);
	/**
	 * 根据goodsid来查询购物车是否有该记录
	 * @param cart
	 * @return
	 */
	public abstract Cart findCartByGoodsid(Cart cart);
	
	/**
	 * 根据userid查询购物车
	 * @param cart
	 * @return
	 */
	public abstract List<Cart> findCartByUserid(int userid);
	/**
	 * 根据cartid删除购物车记录
	 * @param cart
	 * @return
	 */
	public abstract int delCartByCartid(Cart cart);
}
