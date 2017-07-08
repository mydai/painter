package com.painter.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.painter.biz.IGoodstypeBiz;
import com.painter.biz.impl.GoodstypeBizImpl;
import com.painter.entity.Goodstype;

public class ServiceInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		IGoodstypeBiz goodstyeBiz=new GoodstypeBizImpl();
		List<Goodstype> typeList =goodstyeBiz.findALLGoodstype();
		Map<String, Object> application = ActionContext.getContext().getApplication();
		application.put("typeList", typeList);
		
		String invoke = invocation.invoke();
		return invoke;
	}

}
