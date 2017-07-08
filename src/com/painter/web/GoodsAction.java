package com.painter.web;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.IGoodsBiz;
import com.painter.entity.Goods;
import com.painter.entity.Goodstype;
import com.painter.entity.Painter;
import com.painter.util.Condition;
import com.painter.util.FinalConstant;
import com.painter.util.Page;
import com.painter.util.UploadCondition;

public class GoodsAction extends ActionSupport {
	private IGoodsBiz goodsBiz;
	private Goods goods;
	private Condition condition;
	private UploadCondition uploadCondition;
	private Integer typeid;
	private Page page;

	public String showGoodsInfo() throws Exception {
		Goods g = goodsBiz.findGoodsByGoodsid(goods);
		this.setGoods(g);
		return SUCCESS;
	}

	public String service() throws Exception {

		if (typeid == null) {
			return SUCCESS;
		}
		page = new Page();
		if (condition == null) {
			condition = new Condition();
		}
		condition.setTypeid(typeid);
		int goodsRecordCount = goodsBiz.getGoodsRecordCount(condition);
		page.setTotalPage(goodsRecordCount);
		page.setTypeid(typeid);
		page.setPageIndex(condition.getPageIndex());
		List<Goods> list = goodsBiz.findPageGoodsByTypeid(page);
		page.setGoodses(list);
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.put("page", page);
		return SUCCESS;
	}

	public String getGoodsList() throws Exception {
		if (condition == null) {
			condition = new Condition();
		}

		List<Goods> list = goodsBiz.getGoodsList(condition);
		if (list != null) {
			condition.setList(list);
			if (list != null && list.size() > 0) {
				int recordCount = goodsBiz.getGoodsRecordCount(condition);// 单独查询所有商品的总行数
				int pageIndex = condition.getPageIndex();// 得到当前页数
				int pageSize = condition.getPageSize();
				condition.setRecordCount(recordCount);// 设置商品总数
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

	public String findPainterGoods() throws Exception {
		if (condition == null) {
			condition = new Condition();
		}
		Map<String, Object> session = null;
		session = ActionContext.getContext().getSession();
		if (session.containsKey(FinalConstant.CURR_PAINTER)) {
			Painter p = (Painter) session.get(FinalConstant.CURR_PAINTER);
			condition.setPainterid(p.getPainterid());
		}
		List<Goods> list = goodsBiz.findPainterGoods(condition);
		if (list != null) {
			condition.setList(list);
			if (list != null && list.size() > 0) {
				int recordCount = goodsBiz.getGoodsRecordCount(condition);// 单独查询所有商品的总行数
				int pageIndex = condition.getPageIndex();// 得到当前页数
				int pageSize = condition.getPageSize();
				condition.setRecordCount(recordCount);// 设置商品总数
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

	public String addGoods() throws Exception {
		Map<String, Object> session = null;
		session = ActionContext.getContext().getSession();
		if (session.containsKey(FinalConstant.CURR_PAINTER)) {
			Painter p = (Painter) session.get(FinalConstant.CURR_PAINTER);
			Painter painter = new Painter();
			painter.setPainterid(p.getPainterid());
			goods.setPainter(painter);
		}
		if (uploadCondition != null) {
			FileInputStream fis = new FileInputStream(
					uploadCondition.getUpload());
			String img = "upload/" + uploadCondition.getUploadFileName();
			goods.setImg(img);

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

		int count = goodsBiz.addGoods(goods);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String deleteGoods() throws Exception {
		int count = goodsBiz.deleteGoods(goods);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String updateGoods() throws Exception {
		if (uploadCondition != null) {
			FileInputStream fis = new FileInputStream(
					uploadCondition.getUpload());
			String img = "upload/" + uploadCondition.getUploadFileName();
			goods.setImg(img);
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

		int count = goodsBiz.updateGoods(goods);
		if (count > 0) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String findGoods() throws Exception {
		goods = goodsBiz.findGoodsByGoodsid(goods);
		if (goods.getName() != null) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String getGoodsPicture() throws Exception {
		return SUCCESS;
	}

	public IGoodsBiz getGoodsBiz() {
		return goodsBiz;
	}

	public void setGoodsBiz(IGoodsBiz goodsBiz) {
		this.goodsBiz = goodsBiz;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public UploadCondition getUploadCondition() {
		return uploadCondition;
	}

	public void setUploadCondition(UploadCondition uploadCondition) {
		this.uploadCondition = uploadCondition;
	}

}
