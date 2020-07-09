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
public class AdminControls {
	@Autowired  
    JdbcTemplate jdbc;

	@RequestMapping("/Order_Status_management")
	public String update_order_status(HttpServletRequest req,HttpServletResponse res) {
		int order_id=Integer.parseInt(req.getParameter("order_id"));
		String order_status=req.getParameter("order_status");
		jdbc.execute("update vyntra.orders set order_status='"+order_status+"' where order_id="+order_id);
		
		return "admin";
	}
}
