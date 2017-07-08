package com.painter.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Goodstype entity. @author MyEclipse Persistence Tools
 */

public class Goodstype implements java.io.Serializable {

	// Fields

	private Integer typeid;
	private String name;
	private String description;
	private String coverimg;
	private Set<Goods> goodses = new HashSet<Goods>(0);

	// Constructors

	/** default constructor */
	public Goodstype() {
	}

	/** minimal constructor */
	public Goodstype(String name, String description) {
		this.name = name;
		this.description = description;
	}

	/** full constructor */
	public Goodstype(String name, String description, String coverimg,
			Set<Goods> goodses) {
		this.name = name;
		this.description = description;
		this.coverimg = coverimg;
		this.goodses = goodses;
	}

	// Property accessors

	public Integer getTypeid() {
		return this.typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCoverimg() {
		return this.coverimg;
	}

	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}

	public Set<Goods> getgoods() {
		return this.goodses;
	}

	public void setgoods(Set<Goods> goodses) {
		this.goodses = goodses;
	}

}