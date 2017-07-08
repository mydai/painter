package com.painter.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.painter.util.Condition;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IContactBiz;
import com.painter.entity.Contact;
import com.painter.entity.Users;

@SuppressWarnings("serial")
public class ContactAction extends ActionSupport {

	private IContactBiz contactBiz;

	private Contact contact;
	
	private Condition condition;
	
	public String addContact() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		contact.setUsers((Users)session.get("user"));
		int res = contactBiz.addContact(this.getContact());
		
		if(res==0){
			return "error";
		}
		
		return SUCCESS;
	}
	
	public String getContactList()  throws Exception{
		if(condition==null){
			condition = new Condition();
		}
		List<Contact> list = contactBiz.getContactList(condition);
		if(list!=null){
		    condition.setList(list);
		    if(list!=null&&list.size()>0){
		       int recordCount=contactBiz.getContactRecordCount(condition);//单独查询所有信息的总行数
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

	public IContactBiz getContactBiz() {
		return contactBiz;
	}

	public void setContactBiz(IContactBiz contactBiz) {
		this.contactBiz = contactBiz;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}
	
}
