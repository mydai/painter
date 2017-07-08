package com.painter.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer goodsid;
	private Goodstype goodstype;
	private Painter painter;
	private String name;
	private Double price;
	private Integer score;
	private String img;
	private Integer salnum;
	private Set<Dealinfo> dealinfos = new HashSet<Dealinfo>(0);
	private Set<Cart> carts = new HashSet<Cart>(0);

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(Goodstype goodstype, Painter painter, String name,
			Double price, Integer score, String img) {
		this.goodstype = goodstype;
		this.painter = painter;
		this.name = name;
		this.price = price;
		this.score = score;
		this.img = img;
	}

	/** full constructor */
	public Goods(Goodstype goodstype, Painter painter, String name,
			Double price, Integer score, String img, Integer salnum,
			Set<Dealinfo> dealinfos, Set<Cart>  carts) {
		this.goodstype = goodstype;
		this.painter = painter;
		this.name = name;
		this.price = price;
		this.score = score;
		this.img = img;
		this.salnum = salnum;
		this.dealinfos = dealinfos;
		this.carts = carts;
	}

	// Property accessors

	public Integer getGoodsid() {
		return this.goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public Goodstype getGoodstype() {
		return this.goodstype;
	}

	public void setGoodstype(Goodstype goodstype) {
		this.goodstype = goodstype;
	}

	public Painter getPainter() {
		return this.painter;
	}

	public void setPainter(Painter painter) {
		this.painter = painter;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getSalnum() {
		return this.salnum;
	}

	public void setSalnum(Integer salnum) {
		this.salnum = salnum;
	}

	public Set getdealinfo() {
		return this.dealinfos;
	}

	public void setdealinfo(Set<Dealinfo> dealinfos) {
		this.dealinfos = dealinfos;
	}

	public Set getcart() {
		return this.carts;
	}

	public void setcart(Set<Cart> carts) {
		this.carts = carts;
	}

}