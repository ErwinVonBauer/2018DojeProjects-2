package com.groupware.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LinkController {
	@RequestMapping("/index")
	public String showindex(HttpServletRequest req){
		return "/index";
	}
	
	@RequestMapping("/login")
	public String showlogin(HttpServletRequest req){
		return "/login";
	}
	
	@RequestMapping("/join")
	public String showjoin(HttpServletRequest req){
		return "/join";
	}
	
	@RequestMapping("/docdraft")
	public String showdocdraft(HttpServletRequest req){
		return "/docdraft";
	}
	
	@RequestMapping("/doceditor")
	public String showdoceditor(HttpServletRequest req){
		return "/doceditor";
	}
	
	@RequestMapping("/docbox")
	public String showdocbox(HttpServletRequest req){
		return "/docbox";
	}
	
	@RequestMapping("/getapproval")
	public String showgetapproval(HttpServletRequest req){
		return "/getapproval";
	}
	
	@RequestMapping("/approvalhistory")
	public String showapprovalhistory(HttpServletRequest req){
		return "/approvalhistory";
	}
	
}
