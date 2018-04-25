package com.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.groupware.service.TestService;

public class TestController {
	@Autowired TestService testservice;
	
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
}
