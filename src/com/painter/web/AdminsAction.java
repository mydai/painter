package com.painter.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import net.sf.json.JSONObject;

import com.painter.util.FinalConstant;
import com.painter.util.UploadCondition;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IAdminsBiz;
import com.painter.entity.Admins;

@SuppressWarnings("serial")
public class AdminsAction extends ActionSupport {

	private IAdminsBiz adminsBiz;

	private Admins admin;

	private JSONObject result;

	private String yzm;

	public String checkyzm() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");
		boolean flag = false;
		if (yzm == null || rand == null || !yzm.equals(rand)) {
			flag = false;
		} else {
			flag = true;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		result = JSONObject.fromObject(map);
		return SUCCESS;
	}

	public String login() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession sess = request.getSession();
		String rand = (String) sess.getAttribute("rand");
		String tips = "登录失败，请检查账号密码是否正确";
		boolean flag = false;

		if (admin != null) {
			Admins admins = adminsBiz.login(admin);
			if (admins != null) {
				tips = "登录成功";
				flag=true;
				admin.setAdminsid(admins.getAdminsid());
			}
			Map<String, Object> session = null;
			session = ActionContext.getContext().getSession();
			if (session.containsKey(FinalConstant.CURR_ADMIN)) {
				session.remove(FinalConstant.CURR_ADMIN);
			}
			session.put(FinalConstant.CURR_ADMIN, admin);

		}
		if (yzm == null || rand == null || !yzm.equals(rand)) {
			tips = "验证码有误";
			flag = false;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tips", tips);
		map.put("flag", flag);
		result = JSONObject.fromObject(map);
		return SUCCESS;
	}

	public String update() throws Exception {
		boolean flag = false;
		Map<String, Object> updatemap = new HashMap<String, Object>();
		if (admin != null) {
			System.out.println("admin不是空的");
		} else {
			System.out.println("admin是空的a");
		}
		int adminsid = admin.getAdminsid();
		String pwd = admin.getPwd();
		updatemap.put("adminsid", adminsid);
		updatemap.put("pwd", pwd);
		int count = adminsBiz.updateAdmins(updatemap);
		if (count > 0) {
			flag = true;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		result = JSONObject.fromObject(map);
		return SUCCESS;

	}

	public String logoff() throws Exception {
		Map<String, Object> session = null;
		session = ActionContext.getContext().getSession();
		if (session.containsKey(FinalConstant.CURR_ADMIN)) {
			session.remove(FinalConstant.CURR_ADMIN);
		}
		return SUCCESS;
	}

	@JSON(serialize = false)
	public IAdminsBiz getAdminsBiz() {
		return adminsBiz;
	}

	public void setAdminsBiz(IAdminsBiz adminsBiz) {
		this.adminsBiz = adminsBiz;
	}

	public Admins getAdmin() {
		return admin;
	}

	public void setAdmin(Admins admin) {
		this.admin = admin;
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
}
