package com.groupware.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.service.UserService;
import com.groupware.vo.UserVo;

@Controller
public class UserController {
	@Autowired UserService userservice;
	
	//1.회원가입
	@RequestMapping(value="/userjoin",produces = "application/text; charset=utf8")
	public ModelAndView UserJoin(HttpServletRequest req,UserVo vo) {
		return userservice.userjoinlogic(req, vo, "/index");
	}
	
	//2.로그인 확인
		@RequestMapping (value="/userlogincheck.ajax",produces = "application/json")
		@ResponseBody
		public String loginCheck(HttpServletRequest req){   
			return userservice.loginCheck(req);
		}
}
