package com.painter.biz;

import java.util.List;

import com.painter.entity.Goodstype;

public interface IGoodstypeBiz {
		/**
		 * 获取所有的服务类型
		 * @return List<Goodstype>
		 */
		public abstract List<Goodstype> findALLGoodstype();
}
