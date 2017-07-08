package com.painter.dao;

import java.util.List;

import com.painter.entity.Goodstype;

public interface IGoodstypeDao {
	/**
	 * 获取所有的服务类型
	 * @return List<Goodstype>
	 */
	public abstract List<Goodstype> findALLGoodstype();
}
