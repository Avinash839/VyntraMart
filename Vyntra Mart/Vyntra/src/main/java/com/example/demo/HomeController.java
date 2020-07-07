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
		String std=req.getParameter("username");
		req.setAttribute("data", std);
		return "mypage";
	}
	@RequestMapping("/signuppage")
	public String signuppage () {
		return "signuppage";
	}
	@RequestMapping("/wishlist")
	public String wishlist(HttpServletRequest req,HttpServletResponse res) {
		String std=req.getParameter("id");
		req.setAttribute("data", std);
	
		
		return "wishlist";
	}
	@RequestMapping("/getproduct")
	public String viewProduct(HttpServletRequest req,HttpServletResponse res) {
		String std=req.getParameter("id");
		req.setAttribute("data", std); 
		
		return "productdisplay";
	}
	
	
}
