package com.painter.dao;

import java.util.List;

import com.painter.entity.Goods;
import com.painter.util.Condition;
import com.painter.util.Page;

public interface IGoodsDao {
	
	/**
	 * 根据condition实体类信息获取商品列表
	 * @param condition
	 * @return
	 */
	public abstract List<Goods> findGoodsList(Condition condition);

	/**
	 * 根据condition条件查询商品的行数
	 * @param condition
	 * @return
	 */
	public abstract int findGoodsRecordCount(Condition condition);

	/**
	 * 通过传入page对象，根据typeid来查询商品goods的信息
	 * @param page
	 * @return
	 */
	public abstract  List<Goods>  findPageGoodsByTypeid(Page page);

	/**
	 * 在画师管理后台中通过画师id获取该画师的所有作品
	 * @param condition
	 * @return
	 */
	public List<Goods> findGoodsListByPainterid(Condition condition);
	/**
	 * 根据前台传入商品信息添加商品
	 * @param good
	 * @return
	 */
	public abstract int addGoods(Goods goods);
	
	/**
	 * 根据前台传入商品信息更新商品信息
	 * @param good
	 * @return
	 */
	public abstract int updateGoodsById(Goods goods);
	/**
	 * 根据前台商品信息，删除商品
	 * @param good
	 * @return
	 */
	public abstract int delGoodsById(Goods goods);
	
	/**
	 * 根据goodsid查询商品
	 * @param goods
	 * @return
	 */
	public abstract Goods findGoodsByGoodsid(Goods goods);

}
