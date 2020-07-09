package com.example.demo;
import java.util.*;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.io.*;
import java.sql.*;
@Controller
public class HomeController {
 
	@Autowired  
    JdbcTemplate jdbc;
	
	@RequestMapping("/")
	public String view() {
		return "firstpage";
	}
	@RequestMapping("/loginpage")
	public String loginpage () {
		return "loginpage";
	}
	@RequestMapping("/login_to_myaccount")
	public String login_to_myaccount(HttpServletRequest req,HttpServletResponse res) {
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		if(login_id.equals("admin1@gmail.com")) {
			return "admin";
		}
		System.out.println(login_id);
		return "mypage";
	}
	@RequestMapping("/signuppage")
	public String signuppage () {
		return "signuppage";
	}
	@RequestMapping("/add_to_wishlist")
	public String wishlist(HttpServletRequest req,HttpServletResponse res) {
		String login_id=req.getParameter("login_id");
		String product_id=req.getParameter("product_id");
		
		String wishlist_id=login_id.substring(0, login_id.indexOf("@"))+"_wishlist";
		String sql="insert into "+wishlist_id+" values ('pro')".replace("pro", product_id);
		jdbc.execute(sql);
		req.setAttribute("product_id", product_id);
		req.setAttribute("login_id", login_id);
		return "productdisplay";
	}
	@RequestMapping("/add_to_cart")
	public String add_to_cart(HttpServletRequest req,HttpServletResponse res) {
		String login_id=req.getParameter("login_id");
		String product_id=req.getParameter("product_id");
		String cart_id=login_id.substring(0, login_id.indexOf("@"))+"_cart";
		String sql="insert into "+cart_id+" values ('pro')".replace("pro", product_id);
		jdbc.execute(sql);
		req.setAttribute("product_id", product_id);
		req.setAttribute("login_id", login_id);
		return "productdisplay";
	}
	@RequestMapping("/view_cart")
	public String cart(HttpServletRequest req,HttpServletResponse res) {
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		String cart_id=login_id.substring(0, login_id.indexOf("@"))+"_cart";
		req.setAttribute("cart_id", cart_id);
		return "view_cart";
	}
	@RequestMapping("/view_wishlist")
	public String view_wishlist(HttpServletRequest req,HttpServletResponse res) {
		
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		String wishlist_id=login_id.substring(0, login_id.indexOf("@"))+"_wishlist";
		
		req.setAttribute("wishlist_id", wishlist_id);
		return "wishlist";
	}
	@RequestMapping("/getproduct")
	public String viewProduct(HttpServletRequest req,HttpServletResponse res) {
		String product_id=req.getParameter("product_id");
		req.setAttribute("product_id", product_id); 
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		System.out.println("hc getproduct"+login_id);
		return "productdisplay";
	}
	@RequestMapping("/check_out_cart")
	public String check_out_cart(HttpServletRequest req,HttpServletResponse res) {
		String cart_id=req.getParameter("cart_id");
		req.setAttribute("cart_id", cart_id); 
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		System.out.println(login_id+" from checkoutcart home con");
		return "checkout";
	}
	@RequestMapping("/order")
	public String order (HttpServletRequest req,HttpServletResponse res) {
		String cart_id=req.getParameter("cart-id");
		String login_id=req.getParameter("login_id");
		String products=req.getParameter("products");
		String total=req.getParameter("total");
		String orders_id=login_id.substring(0, login_id.indexOf("@"))+"_orders";
		req.setAttribute("login_id", login_id);
		req.setAttribute("cart_id", cart_id);
		req.setAttribute("products", products);
		req.setAttribute("total", total);
		req.setAttribute("orders_id", orders_id);
		String sql="";
		
		return "orderplaced";
	}
	@RequestMapping("/view_orders")
	public String view_orders(HttpServletRequest req,HttpServletResponse res) {
		String login_id=req.getParameter("login_id");
		req.setAttribute("login_id", login_id);
		String orders_id=login_id.substring(0, login_id.indexOf("@"))+"_orders";
		req.setAttribute("login_id", login_id);
		req.setAttribute("orders_id", orders_id);
		
		return "myorders";
	}
	
	@RequestMapping("/return_order")
	public String return_order(HttpServletRequest req,HttpServletResponse res) {
		int order_id=Integer.parseInt(req.getParameter("order_id"));
		String sql="update vyntra.orders set order_status='return placed' where order_id="+order_id;
		req.setAttribute("order_id", order_id);
		return "return_success";
	}
	
	@RequestMapping("/cancel_order")
	public String cancel_order(HttpServletRequest req,HttpServletResponse res) {
		int order_id=Integer.parseInt(req.getParameter("order_id"));
		String sql="update vyntra.orders set order_status='cancelled' where order_id="+order_id;
		req.setAttribute("order_id", order_id);
		return "return_success";
	}
}
