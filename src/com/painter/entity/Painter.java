package com.painter.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Painter entity. @author MyEclipse Persistence Tools
 */

public class Painter implements java.io.Serializable {

	// Fields

	private Integer painterid;
	private String name;
	private String pwd;
	private Double money;
	private Integer score;
	private String img;
	private Date hiredate;
	private String intro;
	private Set<Goods> goodses = new HashSet<Goods>(0);

	// Constructors

	/** default constructor */
	public Painter() {
	}

	/** minimal constructor */
	public Painter(String name, String pwd) {
		this.name = name;
		this.pwd = pwd;
	}

	/** full constructor */
	public Painter(String name, String pwd, Double money, Integer score,
			String img, Date hiredate, String intro, Set<Goods> goodses) {
		this.name = name;
		this.pwd = pwd;
		this.money = money;
		this.score = score;
		this.img = img;
		this.hiredate = hiredate;
		this.intro = intro;
		this.goodses = goodses;
	}

	// Property accessors

	public Integer getPainterid() {
		return this.painterid;
	}

	public void setPainterid(Integer painterid) {
		this.painterid = painterid;
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

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getHiredate() {
		return this.hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Set<Goods> getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set<Goods> goodses) {
		this.goodses = goodses;
	}

}