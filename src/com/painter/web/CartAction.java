package com.painter.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.painter.biz.ICartBiz;
import com.painter.biz.IDealinfoBiz;
import com.painter.biz.IUsersBiz;
import com.painter.entity.Cart;
import com.painter.entity.Dealinfo;
import com.painter.entity.Users;

public class CartAction extends ActionSupport{
	private ICartBiz cartBiz;
	private IUsersBiz usersBiz;
	private Cart cart;
	private Dealinfo dealinfo;
	private IDealinfoBiz dealinfoBiz;
	private List<Cart> carts;
	private InputStream inputStream;
	
	public String referCart() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users user=(Users)session.get("user");
		dealinfo.setUsers(user);
		Users newuser = usersBiz.login(user);
		session.put("user", newuser);
		dealinfoBiz.addDealinfo(dealinfo);
		
		cartBiz.delCartByCartid(cart);
		String result="";
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		return SUCCESS;
	}
	
	public String delCart() throws Exception{
		int res= cartBiz.delCartByCartid(cart);
		if(res>0){
			Map<String, Object> session = ActionContext.getContext().getSession();
			Users u = (Users)session.get("user");
			List<Cart> list = cartBiz.findCartByUserid(u.getUserid());
			this.setCarts(list);
			String result="删除成功";
			inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
			return SUCCESS;
		}
		return SUCCESS;
	}
	public String showCartList() throws Exception{
		Map<String, Object> session = ActionContext.getContext().getSession();
		Users u = (Users)session.get("user");
		List<Cart> list = cartBiz.findCartByUserid(u.getUserid());
		this.setCarts(list);
		return SUCCESS;
	}
	
	public String addCart() throws Exception{
		Cart c = cartBiz.findCartByGoodsid(cart);
		if(c==null){
			Map<String, Object> session = ActionContext.getContext().getSession();
			Users u = (Users)session.get("user");
			cart.setUsers(u);
			cartBiz.addCart(cart);
		}else{
			c.setGoodsnum(cart.getGoodsnum()+c.getGoodsnum());
			cartBiz.updateCartGoodsnum(c);
		}
		String result="添加购物车成功";
		inputStream = new ByteArrayInputStream(result.getBytes("utf-8"));
		
		return SUCCESS;
	}
	
	
	public ICartBiz getCartBiz() {
		return cartBiz;
	}
	public void setCartBiz(ICartBiz cartBiz) {
		this.cartBiz = cartBiz;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}


	public InputStream getInputStream() {
		return inputStream;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	public Dealinfo getDealinfo() {
		return dealinfo;
	}
	public void setDealinfo(Dealinfo dealinfo) {
		this.dealinfo = dealinfo;
	}
	public IDealinfoBiz getDealinfoBiz() {
		return dealinfoBiz;
	}
	public void setDealinfoBiz(IDealinfoBiz dealinfoBiz) {
		this.dealinfoBiz = dealinfoBiz;
	}

	public IUsersBiz getUsersBiz() {
		return usersBiz;
	}

	public void setUsersBiz(IUsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}


	
	
	
	
}
