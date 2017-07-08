package com.painter.web;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IUsersBiz;
import com.painter.entity.Users;
import com.painter.util.Condition;

public class UsersAction extends ActionSupport {
	private IUsersBiz usersBiz;
	private Users user;
	private JSONObject result;
	private Condition condition;
	private String yzm;
	private Double addmoney;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String savePath;
	private InputStream inputStream;

	public String relogin() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("user");
		return SUCCESS;
	}

	public String flushUsers() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users u = (Users) session.get("user");
		if (user.getName().equals(u.getName())
				&& user.getPwd().equals(u.getPwd())) {
			return "error";
		} else {
			user.setUserid(u.getUserid());
			usersBiz.updateUser(user);

			session.remove("user");

			return SUCCESS;
		}
	}

	public String addMoney() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users u = (Users) session.get("user");
		u.setMoney(u.getMoney() + addmoney);
		int res = usersBiz.updateUser(u);
		session.put("user", u);
		if (res < 1) {
			return "error";
		}
		return SUCCESS;

	}

	public String tlogin() throws Exception {
		String result = "";
		if (yzm == null) {
			Users u = usersBiz.login(user);
			if (u != null) {
				result = "用户名和密码匹配";
			} else {
				result = "用户名或密码错误";
			}
		} else {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String rand = (String) session.getAttribute("rand");
			if (yzm == null || rand == null || !yzm.equals(rand)) {
				result = "验证码输入错误";
			} else {
				result = "验证码正确";
			}
		}

		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}

	public String login() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");
		if (yzm == null || rand == null || !yzm.equals(rand)) {
			return "error";
		}
		Users u = usersBiz.login(this.getUser());
		if (u == null) {
			return "error";
		}
		session.setAttribute("user", u);

		/*
		 * Cookie c = new Cookie("JSESSIONID",session.getId());
		 * c.setMaxAge(60*60); response.addCookie(c);
		 */

		return SUCCESS;

	}

	public String checkName() throws Exception {
		String result = "用户名可用";
		Users u = usersBiz.checkName(user.getName());
		if (u != null) {
			result = "该用户名已被注册";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}

	public String reg() throws Exception {
		if (upload != null) {
			FileInputStream fis = new FileInputStream(this.getUpload());
			String avatar = "upload/" + getUploadFileName();
			user.setAvatar(avatar);
			FileOutputStream fos = new FileOutputStream(getSavePath() + "\\"
					+ getUploadFileName());
			byte[] buffer = new byte[1024];

			for (int length = fis.read(buffer); length > 0; length = fis
					.read(buffer)) {
				fos.write(buffer, 0, length);
			}

			fis.close();
			fos.flush();
			fos.close();
		}
		usersBiz.reg(user);
		return SUCCESS;
	}

	public String getUsersList() throws Exception {
		if (condition == null) {
			condition = new Condition();
		}
		List<Users> list = usersBiz.getUsersList(condition);
		if (list != null) {
			condition.setList(list);
			if (list != null && list.size() > 0) {
				int recordCount = usersBiz.getUsersRecordCount(condition);// 单独查询所有用户的总行数
				int pageIndex = condition.getPageIndex();// 得到当前页数
				int pageSize = condition.getPageSize();
				condition.setRecordCount(recordCount);// 设置用户总数
				int totalPage = recordCount % pageSize == 0 ? recordCount
						/ pageSize : recordCount / pageSize + 1;// 得到总页数
				condition.setTotalPage(totalPage);
				HttpServletRequest request = ServletActionContext.getRequest();
				request.setAttribute("pageIndex", pageIndex);
				request.setAttribute("totalPage", totalPage);
				return SUCCESS;
			} else {
				return ERROR;
			}
		} else {
			return ERROR;
		}
	}

	public String getUserById() throws Exception {
		System.out.println("用户ID" + user.getUserid());
		user = usersBiz.findUsersById(user);
		if (user.getName() != null) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String addUser() throws Exception {
		if (user != null) {
			if (upload != null) {
				FileInputStream fis = new FileInputStream(this.getUpload());
				String avatar = "upload/" + getUploadFileName();
				user.setAvatar(avatar);
				FileOutputStream fos = new FileOutputStream(getSavePath()
						+ "\\" + getUploadFileName());
				byte[] buffer = new byte[1024];

				for (int length = fis.read(buffer); length > 0; length = fis
						.read(buffer)) {
					fos.write(buffer, 0, length);
				}

				fis.close();
				fos.flush();
				fos.close();
			}
		}

		usersBiz.reg(user);
		return SUCCESS;
	}

	public String delUser() throws Exception {
		int count = usersBiz.delUser(user);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String updateUser() throws Exception {
		if (user != null) {
			if (upload != null) {
				FileInputStream fis = new FileInputStream(this.getUpload());
				String avatar = "upload/" + getUploadFileName();
				user.setAvatar(avatar);
				FileOutputStream fos = new FileOutputStream(getSavePath()
						+ "\\" + getUploadFileName());
				byte[] buffer = new byte[1024];

				for (int length = fis.read(buffer); length > 0; length = fis
						.read(buffer)) {
					fos.write(buffer, 0, length);
				}

				fis.close();
				fos.flush();
				fos.close();
			}
			int count = usersBiz.updateUser(user);
			if (count > 0) {
				return SUCCESS;
			}
		}
		return ERROR;
	}

	@JSON(serialize = false)
	public IUsersBiz getUsersBiz() {
		return usersBiz;
	}

	public void setUsersBiz(IUsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Double getAddmoney() {
		return addmoney;
	}

	public void setAddmoney(Double addmoney) {
		this.addmoney = addmoney;
	}

}
