package com.painter.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String name;
	private String pwd;
	private String email;
	private Double money;
	private Integer score;
	private Date regdate;
	private String avatar;
	private Set<Contact> contacts = new HashSet<Contact>(0);
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<Dealinfo> dealinfos = new HashSet<Dealinfo>(0);

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String name, String pwd, String email) {
		this.name = name;
		this.pwd = pwd;
		this.email = email;
	}

	/** full constructor */
	public Users(Integer userid, String name, String pwd, String email,
			Double money, Integer score, Date regdate, String avatar,
			Set<Contact> contacts, Set<Cart> carts, Set<Dealinfo> dealinfos) {
		super();
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.money = money;
		this.score = score;
		this.regdate = regdate;
		this.avatar = avatar;
		this.contacts = contacts;
		this.carts = carts;
		this.dealinfos = dealinfos;
	}


	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	
	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Set<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}

	public Set<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	public Set<Dealinfo> getDealinfos() {
		return dealinfos;
	}

	public void setDealinfos(Set<Dealinfo> dealinfos) {
		this.dealinfos = dealinfos;
	}


}