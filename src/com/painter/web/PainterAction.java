package com.painter.web;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IPainterBiz;
import com.painter.entity.Painter;
import com.painter.entity.Users;
import com.painter.util.Condition;
import com.painter.util.FinalConstant;
import com.painter.util.UploadCondition;

public class PainterAction extends ActionSupport {
	private IPainterBiz painterBiz;

	private Painter painter;

	private Condition condition;

	private JSONObject result;

	private UploadCondition uploadCondition;

	private String yzm;

	private InputStream inputStream;

	public String checkyzm() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String rand = (String) session.getAttribute("rand");
		boolean flag = true;
		if (yzm == null || rand == null || !yzm.equals(rand)) {
			flag = false;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		result = JSONObject.fromObject(map);
		return SUCCESS;
	}

	public String showPainter() throws Exception {
		List<Painter> painterList = painterBiz.findAllPainter();
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("painterList", painterList);
		return SUCCESS;
	}

	public String getPainterList() throws Exception {
		if (condition == null) {
			condition = new Condition();
		}
		List<Painter> list = painterBiz.getPainterList(condition);
		if (list != null) {
			condition.setList(list);
			if (list != null && list.size() > 0) {
				int recordCount = painterBiz.getPainterRecordCount(condition);// 单独查询所有信息的总行数
				int pageIndex = condition.getPageIndex();// 得到当前页数
				int pageSize = condition.getPageSize();
				condition.setRecordCount(recordCount);// 设置信息总数
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

	public String addPainter() throws Exception {
		if (uploadCondition != null) {
			FileInputStream fis = new FileInputStream(
					uploadCondition.getUpload());
			String img = "upload/" + uploadCondition.getUploadFileName();
			painter.setImg(img);
			FileOutputStream fos = new FileOutputStream(
					uploadCondition.getSavePath() + "\\"
							+ uploadCondition.getUploadFileName());
			byte[] buffer = new byte[1024];

			for (int length = fis.read(buffer); length > 0; length = fis
					.read(buffer)) {
				fos.write(buffer, 0, length);
			}

			fis.close();
			fos.flush();
			fos.close();
		}

		int count = painterBiz.addPainter(painter);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String deletePainter() throws Exception {
		int count = painterBiz.deletePainter(painter);
		if (count > 0) {
			return "success";
		}
		return "error";
	}

	public String findPainter() throws Exception {
		painter = painterBiz.findPainter(painter);
		if (painter.getName() != null) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String updatePainter() throws Exception {
		if (uploadCondition != null) {
			FileInputStream fis = new FileInputStream(
					uploadCondition.getUpload());
			String img = "upload/" + uploadCondition.getUploadFileName();
			painter.setImg(img);
			FileOutputStream fos = new FileOutputStream(
					uploadCondition.getSavePath() + "\\"
							+ uploadCondition.getUploadFileName());
			byte[] buffer = new byte[1024];

			for (int length = fis.read(buffer); length > 0; length = fis
					.read(buffer)) {
				fos.write(buffer, 0, length);
			}

			fis.close();
			fos.flush();
			fos.close();
		}

		int count = painterBiz.updatePainter(painter);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String updatePainterInfo() throws Exception {
		if (uploadCondition != null) {
			FileInputStream fis = new FileInputStream(
					uploadCondition.getUpload());
			String img = "upload/" + uploadCondition.getUploadFileName();
			painter.setImg(img);
			FileOutputStream fos = new FileOutputStream(
					uploadCondition.getSavePath() + "\\"
							+ uploadCondition.getUploadFileName());
			byte[] buffer = new byte[1024];

			for (int length = fis.read(buffer); length > 0; length = fis
					.read(buffer)) {
				fos.write(buffer, 0, length);
			}

			fis.close();
			fos.flush();
			fos.close();
		}

		int count = painterBiz.updatePainter(painter);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String checkName() throws Exception {
		String result = "用户名可用";
		Painter p = painterBiz.checkName(painter);
		if (p !=null) {
			result = "该用户名已被注册";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}

	/**
	 * 画师登录
	 * 
	 * @return
	 */
	public String painterlogin() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession sess = request.getSession();
		String rand = (String) sess.getAttribute("rand");
		String tips = "登录失败，请检查账号密码是否正确";
		Boolean flag = false;
		Painter painters = null;
		if (painter != null) {
			painters = painterBiz.login(painter);
			if (painters != null) {
				tips = "登录成功";
				flag = true;
			}
			Map<String, Object> session = null;
			session = ActionContext.getContext().getSession();
			session.put(FinalConstant.CURR_PAINTER, painters);
			if (session.containsKey(FinalConstant.CURR_PAINTER)) {
				session.remove(FinalConstant.CURR_PAINTER);
			}
			session.put(FinalConstant.CURR_PAINTER, painters);
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

	public IPainterBiz getPainterBiz() {
		return painterBiz;
	}

	public void setPainterBiz(IPainterBiz painterBiz) {
		this.painterBiz = painterBiz;
	}

	public Painter getPainter() {
		return painter;
	}

	public void setPainter(Painter painter) {
		this.painter = painter;
	}

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public UploadCondition getUploadCondition() {
		return uploadCondition;
	}

	public void setUploadCondition(UploadCondition uploadCondition) {
		this.uploadCondition = uploadCondition;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}
