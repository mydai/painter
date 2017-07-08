package com.painter.dao;

import java.util.HashMap;
import java.util.List;

import com.painter.entity.Contact;
import com.painter.entity.Painter;
import com.painter.entity.Users;
import com.painter.util.Condition;

public interface IPainterDao {
	/**
	 * 获取所有画师
	 * @return
	 */
	public abstract List<Painter> findAllPainter();
	
    /**
     * Painter中的方法，将查询所需条件全部放入condition中，
     * 可以分页查询所有画师的信息列表，可以根据用户名查询单个画师
     * @param map
     * @return
     */
	
	public abstract List<Painter> findPainterList(Condition condition); 
	
    /**
     * 获取总信息行数RecordCount,用于分页
     * @param condition
     * @return
     */
	public abstract int findPainterRecordCount(Condition condition);
	
    /**
     * 通过前台Painter传入添加画师信息
     * @param painter
     * @return
     */
	public abstract int addPainter(Painter painter);
	
	/**
	 * 通过传入的painter的painterid属性查找对应的painter对象
	 * @param painter
	 * @return
	 */
	public abstract Painter findPainterById(Painter painter);
	/**
	 * 通过传入的画师信息来查找对应的单个画师
	 * @param painter
	 * @return
	 */
	public abstract Painter findPainterByName(Painter painter);
	/**
	 * 通过前台更新画师信息
	 * @param painter
	 * @return
	 */
	public abstract int updatePainterById(Painter painter);
	
    /**
     * 删除画师
     * @param painter
     * @return
     */
	public abstract int delPainterById(Painter painter);
	
    /**
     * 画师登录
     * @param painter
     * @return
     */
	public Painter findPainterByLogin(Painter painter);
}
