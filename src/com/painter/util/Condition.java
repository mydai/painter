package com.painter.util;
import java.util.List;
/**
 * 用于分页
 * @author dDaidai
 *
 */
public class Condition {
	private int pageIndex=1;
	private int pageSize=2;
	private int totalPage;
	private int recordCount;
	private int typeid;
	private int userid;
	private int painterid;
	private List list;
	
	public Condition() {}
	
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
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getRecordCount() {
		return recordCount;
	}
	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getPainterid() {
		return painterid;
	}

	public void setPainterid(int painterid) {
		this.painterid = painterid;
	}
	
}
