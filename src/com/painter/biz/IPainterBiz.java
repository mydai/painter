package com.painter.biz;

import java.util.List;

import com.painter.entity.Painter;
import com.painter.util.Condition;

public interface IPainterBiz {

	public abstract List<Painter> findAllPainter();
	
    /**
     * Painter中的方法，将查询所需条件全部放入condition中，
     * 可以分页查询所有画师的信息列表，可以根据用户名查询单个画师
     * @param map
     * @return
     */
	
	public abstract List<Painter> getPainterList(Condition condition); 
	
	/**
	 * 获取总信息行数RecordCount,用于分页
	 */
	public abstract int getPainterRecordCount(Condition condition);
	
	/**
	 * 通过前台Painter传入添加画师信息
	 */
	public abstract int addPainter(Painter painter);
	
	
	/**
	 * 通过传入的画师姓名来检查是否已存在画师
	 * @param painter
	 * @return
	 */
	public abstract Painter checkName(Painter painter);
	/**
	 * 通过传入的painter的painterid属性查找对应的painter对象
	 * @param painter
	 * @return
	 */
	public abstract Painter findPainter(Painter painter);
	/**
	 * 通过前台更新画师信息
	 */
	public abstract int updatePainter(Painter painter);

	/**
	 * 画师登录
	 */
	
	public Painter login(Painter painter);
	
	/**
	 * 删除画师
	 */
	public abstract int deletePainter(Painter painter);

}
