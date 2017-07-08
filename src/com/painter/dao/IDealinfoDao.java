package com.painter.dao;

import java.util.List;

import com.painter.entity.Dealinfo;
import com.painter.util.Condition;

public interface IDealinfoDao {
   
    /**
     * IDealinfoDao中的方法，将查询所需条件全部放入condition中，
     * 可以分页查询所有交易的信息列表，可以根据用户名查询单个交易记录
     * @param map
     * @return
     */
	
	public abstract List<Dealinfo> findDealinfoList(Condition condition); 
	
	/**
	 * 获取总信息行数RecordCount,用于分页
	 */
	public abstract int findDealinfoRecordCount(Condition condition);
	
	/**
	 * 添加交易信息
	 */
	public abstract int addDealinfo(Dealinfo dealinfo);
}
