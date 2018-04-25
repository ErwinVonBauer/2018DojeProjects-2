package com.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.groupware.service.EditorService;
import com.groupware.vo.EditorVo;
import javax.servlet.http.HttpServletRequest;

@Controller
public class EditorController {
	@Autowired EditorService editorservice;
	
	//파일 업로드에 필요한 querystring 탑제 메소드
	@RequestMapping("/makePopup")
	public ModelAndView putQuerystring(HttpServletRequest req) {
		return editorservice.putQuerystring(req);
	}

	// 단일파일업로드
	  @RequestMapping("/photoUpload")
	  public String photoUpload(HttpServletRequest req, EditorVo vo) {
		  return editorservice.photoUpload(req, vo);
	  }
}