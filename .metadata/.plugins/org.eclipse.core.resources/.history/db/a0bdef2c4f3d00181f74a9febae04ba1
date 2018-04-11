package com.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.groupware.vo.EditorVo;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

@Controller
public class EditorController {
	//파일 업로드에 필요한 querystring 탑제 메소드
	@RequestMapping("/photo_uploader/popup/photo_uploader")
	public ModelAndView putQuerystring(HttpServletRequest req) {
		String qs = req.getParameter("textareaName");
		ModelAndView view = new ModelAndView();
		view.setViewName("/photo_uploader");
		view.addObject(qs);
		System.out.println(qs);	
		return view;
	}
	
	// 단일파일업로드
	  @RequestMapping("/photoUpload")
	   public String photoUpload(HttpServletRequest req, EditorVo vo) {
		  System.out.println("이미지컨트롤작동성공");
		  String uploadurl = req.getParameter("textareaName");
		  System.out.println();
	      String callback = vo.getCallback();
	      String callback_func = vo.getCallback_func();
	      MultipartFile file = vo.getFiledata();
	      String original_name = file.getOriginalFilename();
	      String file_result = "";
	      try {
	         if (file != null && original_name != null && !original_name.equals("")) {

	            String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
	            String rootPath = getRootPath(req);
	            String path = rootPath + "temp" + File.separator;
	            System.out.println(rootPath);
	            mkdir(path);

	            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
	            Date date = new Date();
	            String time = format.format(date);
	            String real_name = time + "." + ext;

	            file.transferTo(new File(path + real_name));
	            file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/temp/" + real_name;
	         } else {
	            file_result += "&errstr=error";
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	   }

	   // 상위 경로 얻는 메소드
	   public static String getRootPath(HttpServletRequest req) {
	      String exactOs = System.getProperty("os.name"); // key = os.name, value = 현재 컴퓨터의 OS 이름
	      String os = exactOs.split(" ")[0]; // 넘어온 이름값을 공백으로 잘랐을때 0번째 방의 값
	      if (os.equals("Windows")) {
	         return req.getSession().getServletContext().getRealPath("/");
	      } else {
	         return "";
	      }
	   }

	   // 폴더 생성 메소드
	   private void mkdir(String dir_path) {
	      File dir = new File(dir_path);
	      if (!dir.exists()) // 폴더 존재 여부
	         dir.mkdirs(); // 현재 폴더와 상위 폴더까지 생성
	   }
}
