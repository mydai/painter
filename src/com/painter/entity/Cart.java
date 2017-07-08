package com.painter.entity;


/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	// Fields

	private Integer cartid;
	private Goods goods;
	private Users users;
	private Integer goodsnum;


	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** full constructor */
	public Cart(Goods goods, Users users, Integer goodsnum) {
		this.goods = goods;
		this.users = users;
		this.goodsnum = goodsnum;
		
	}

	// Property accessors

	public Integer getCartid() {
		return this.cartid;
	}

	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Integer getGoodsnum() {
		return this.goodsnum;
	}

	public void setGoodsnum(Integer goodsnum) {
		this.goodsnum = goodsnum;
	}

}