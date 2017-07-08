package com.painter.web;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IGoodstypeBiz;
import com.painter.entity.Goodstype;
import com.painter.entity.Painter;
import com.painter.util.FinalConstant;

public class GoodstypeAction extends ActionSupport{
	private IGoodstypeBiz goodstypeBiz;
	
	public IGoodstypeBiz getGoodstypeBiz() {
		return goodstypeBiz;
	}

	public void setGoodstypeBiz(IGoodstypeBiz goodstypeBiz) {
		this.goodstypeBiz = goodstypeBiz;
	}

	public String show() throws Exception {
		List<Goodstype> typeList =goodstypeBiz.findALLGoodstype();
		if(typeList==null)
			return "error";
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("typeList", typeList);
		return SUCCESS;
	}
	
	public String showgoodstype() throws Exception {
		List<Goodstype> typeList =goodstypeBiz.findALLGoodstype();
		if(typeList==null)
			return "error";
		Map<String, Object> session = null;
		session = ActionContext.getContext().getSession();
		if (session.containsKey(FinalConstant.CURR_TYPELIST)) {
			session.remove(FinalConstant.CURR_TYPELIST);
		}
		session.put(FinalConstant.CURR_TYPELIST, typeList);
		return "painterlogin";
	}
}
