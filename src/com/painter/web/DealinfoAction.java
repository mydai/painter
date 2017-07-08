package com.painter.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IDealinfoBiz;
import com.painter.biz.IUsersBiz;
import com.painter.entity.Dealinfo;
import com.painter.entity.Users;
import com.painter.util.Condition;

@SuppressWarnings("serial")
public class DealinfoAction extends ActionSupport {
	private IUsersBiz usersBiz;
	private IDealinfoBiz dealinfoBiz;

	private Dealinfo dealinfo;
	
	private Condition condition;
	
	public String showDealinfo(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		if(condition==null){
			condition=new Condition();
		}
		condition.setUserid(user.getUserid());
		int recordCount = dealinfoBiz.getDealinfoRecordCount(condition);
		condition.setPageSize(4);
		condition.setRecordCount(recordCount);
		int res=(recordCount+3)/4;
		condition.setTotalPage(res);
		List<Dealinfo> list = dealinfoBiz.getDealinfoList(condition);
		condition.setList(list);
		ActionContext context = ActionContext.getContext();
		context.put("condition", condition);
		
		return SUCCESS;
	}
	
	public String save() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		dealinfo.setUsers(user);
		if(user.getMoney()<dealinfo.getMoney()){
			return "error";
		}
		dealinfoBiz.addDealinfo(dealinfo);
		Users newuser = usersBiz.login(user);
		session.put("user", newuser);
		return SUCCESS;
	}
	
	
	public String getDealinfoList()  throws Exception{
		if(condition==null){
			condition = new Condition();
		}
		List<Dealinfo> list = dealinfoBiz.getDealinfoList(condition);
		if(list!=null){
		    condition.setList(list);
		    if(list!=null&&list.size()>0){
		       int recordCount=dealinfoBiz.getDealinfoRecordCount(condition);//单独查询所有信息的总行数
		       int pageIndex = condition.getPageIndex();//得到当前页数
		       int pageSize =condition.getPageSize();
			   condition.setRecordCount(recordCount);//设置信息总数
			   int totalPage=recordCount%pageSize==0?recordCount/pageSize:recordCount/pageSize+1;//得到总页数
			   condition.setTotalPage(totalPage);
			   HttpServletRequest request = ServletActionContext.getRequest();
			   request.setAttribute("pageIndex", pageIndex);
			   request.setAttribute("totalPage", totalPage);
			   return SUCCESS;
		    }else{
			   return ERROR;
		    }
		 }else{
			  return ERROR;
		 }
	}
    
	

	public IDealinfoBiz getDealinfoBiz() {
		return dealinfoBiz;
	}



	public void setDealinfoBiz(IDealinfoBiz dealinfoBiz) {
		this.dealinfoBiz = dealinfoBiz;
	}



	public Dealinfo getDealinfo() {
		return dealinfo;
	}



	public void setDealinfo(Dealinfo dealinfo) {
		this.dealinfo = dealinfo;
	}



	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}


	public IUsersBiz getUsersBiz() {
		return usersBiz;
	}


	public void setUsersBiz(IUsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	
}
