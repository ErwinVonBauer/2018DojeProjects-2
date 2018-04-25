package com.groupware.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.service.CommonService;
import com.groupware.service.DraftService;
import com.groupware.vo.DraftVo;

@Controller
public class DraftController {
	@Autowired DraftService draftservice;
	@Autowired CommonService commonservice;
	
	@RequestMapping("/draftdoc")
	public ModelAndView showdraftdoc(HttpServletRequest req) {
		return commonservice.selectdoc(req);
	}
	
	@RequestMapping(value="/loadpreview.ajax",produces = "application/text; charset=utf8")
	@ResponseBody
	public String loadpreview(HttpServletRequest req,DraftVo draftvo) {
		return draftservice.loadpreview(req,draftvo);
	}
	
	@RequestMapping(value="/makedoclists.ajax",produces = "application/text; charset=utf8")
	@ResponseBody
	public String makedoclist(HttpServletRequest req,DraftVo draftvo) {
		return draftservice.makedoclist(req,draftvo);
	}
	
	@RequestMapping("gochangedoc")
	public ModelAndView gochangedoc(HttpServletRequest req,DraftVo draftvo) {
		return draftservice.gochangedoc(req,draftvo,"/changedoc");
	}

	@RequestMapping("/draftmanager")
	public ModelAndView showdraftmanager(HttpServletRequest req) {
		return commonservice.selectdoc(req);
	}
	
	@RequestMapping("/writedoc")
	public ModelAndView adduserinfo() {
		return draftservice.adduserinfo();
	}
	
	@RequestMapping("/insertdoc")
	public ModelAndView insertdoc(DraftVo draftvo) {
		return draftservice.insertdoc(draftvo,"/index");
	}
	
	@RequestMapping("/updatedoc")
	public String updatedoc(DraftVo draftvo) {
		return draftservice.updatedoc(draftvo,"/index");
	}
	
}