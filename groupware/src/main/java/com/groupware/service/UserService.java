package com.groupware.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.dao.UserDao;
import com.groupware.vo.UserVo;

@Service
public class UserService {
	@Autowired UserDao userdao;
	@Autowired HttpSession session;
	
	//1.회원가입 서비스
	public ModelAndView userjoinlogic(HttpServletRequest req, UserVo userVo, String viewName) {
		ModelAndView model = new ModelAndView(viewName);
		model.addObject("vo",userVo);
			
		System.out.println(userVo.toString());
		System.out.println("success");
			
		//session.setAttribute(name, value);
		userdao.updatenewuser(userVo);
		return model;
	}
	
	//2.로그인 서비스
	public String loginCheck(HttpServletRequest req){
		String logininfo[] = req.getParameterValues("logininfo");
		String logininfocut[] = logininfo[0].split(",");
		String userid = logininfocut[0];
		String userpw = logininfocut[1];
		
		int idoverlap = userdao.useridCheck(userid);
		int pwoverlap = userdao.userpwCheck(userpw);
		
		System.out.println("확인된 아이디:"+idoverlap+"개\n확인된 비밀번호:"+pwoverlap+"개");
		if(idoverlap+pwoverlap==2){
			System.out.println("login_status:success");
			session.setAttribute("id", userid);
			return "1";	
		}else{
			System.out.println("login_status:fail");
			return "0";
		}
	}
}
