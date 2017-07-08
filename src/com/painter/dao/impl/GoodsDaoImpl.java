package com.painter.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.painter.dao.IGoodsDao;
import com.painter.entity.Goods;
import com.painter.util.Condition;
import com.painter.util.Page;

public class GoodsDaoImpl implements IGoodsDao {
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Goods findGoodsByGoodsid(Goods goods) {
		Goods g = sqlSessionTemplate.selectOne("com.painter.dao.IGoodsDao.findGoodsByGoodsid", goods);
		return g;
	}

	@Override
	public List<Goods> findPageGoodsByTypeid(Page page) {
		List<Goods> selectList =sqlSessionTemplate.selectList("com.painter.dao.IGoodsDao.findPageGoodsByTypeid", page); ;
		return selectList;
	}
	@Override
	public List<Goods> findGoodsListByPainterid(Condition condition) {
		List<Goods> List =sqlSessionTemplate.selectList("com.painter.dao.IGoodsDao.findGoodsListByPainterid", condition); ;
		return List;
	}
	@Override
	public List<Goods> findGoodsList(Condition condition) {
		List<Goods> list = sqlSessionTemplate.selectList("com.painter.dao.IGoodsDao.findGoodsList",condition);
		return list;
	}

	@Override
	public int findGoodsRecordCount(Condition condition) {
		int count = 0;
        count = sqlSessionTemplate.selectOne("com.painter.dao.IGoodsDao.findGoodsRecordCount",condition);
		return count;
	}
	
	@Override
	public int addGoods(Goods goods) {
		return sqlSessionTemplate.insert("com.painter.dao.IGoodsDao.addGoods",goods);
	}
	
	@Override
	public int updateGoodsById(Goods goods) {
		return sqlSessionTemplate.update("com.painter.dao.IGoodsDao.updateGoodsById",goods);
	}
	
	@Override
	public int delGoodsById(Goods goods) {
		return sqlSessionTemplate.delete("com.painter.dao.IGoodsDao.delGoodsById",goods);
	}
	

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	




	
	
}
