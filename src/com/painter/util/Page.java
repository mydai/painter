package com.painter.util;

import java.util.List;

import com.painter.entity.Goods;

public class Page {
	private int pageIndex=1;
	private int pageSize=6;
	private int totalPage;
	private Integer typeid;
	private List<Goods> goodses;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int recordCount) {
		this.totalPage = (recordCount+pageSize-1)/pageSize;
	}
	
	public List<Goods> getGoodses() {
		return goodses;
	}
	public void setGoodses(List<Goods> goodses) {
		this.goodses = goodses;
	}
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	
	
	
}
