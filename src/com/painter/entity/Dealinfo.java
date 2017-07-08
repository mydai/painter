package com.painter.entity;

import java.util.Date;

/**
 * Dealinfo entity. @author MyEclipse Persistence Tools
 */

public class Dealinfo implements java.io.Serializable {

	// Fields

	private Integer dealinfoid;
	private Goods goods;
	private Users users;
	private Date dealdate;
	private Integer goodsnum;
	private Double money;
	private Integer score;

	// Constructors

	/** default constructor */
	public Dealinfo() {
	}

	/** full constructor */
	public Dealinfo(Goods goods, Users users, Date dealdate,
			Integer goodsnum, Double money, Integer score) {
		this.goods = goods;
		this.users = users;
		this.dealdate = dealdate;
		this.goodsnum = goodsnum;
		this.money = money;
		this.score = score;
	}

	// Property accessors

	public Integer getDealinfoid() {
		return this.dealinfoid;
	}

	public void setDealinfoid(Integer dealinfoid) {
		this.dealinfoid = dealinfoid;
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

	public Date getDealdate() {
		return this.dealdate;
	}

	public void setDealdate(Date dealdate) {
		this.dealdate = dealdate;
	}

	public Integer getGoodsnum() {
		return this.goodsnum;
	}

	public void setGoodsnum(Integer goodsnum) {
		this.goodsnum = goodsnum;
	}

	public Double getMoney() {
		return this.money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}