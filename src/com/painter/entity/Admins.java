package com.painter.entity;


/**
 * Admins entity. @author MyEclipse Persistence Tools
 */

public class Admins implements java.io.Serializable {

	// Fields

	private Integer adminsid;
	private String name;
	private String pwd;

	// Constructors

	/** default constructor */
	public Admins() {
	}

	/** full constructor */
	public Admins(String name, String pwd) {
		this.name = name;
		this.pwd = pwd;
	}

	// Property accessors

	public Integer getAdminsid() {
		return this.adminsid;
	}

	public void setAdminsid(Integer adminsid) {
		this.adminsid = adminsid;
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

}