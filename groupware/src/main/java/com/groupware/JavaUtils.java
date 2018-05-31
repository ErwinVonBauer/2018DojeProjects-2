package com.groupware;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class JavaUtils {
	
	//1.특정문자열만 추출하여 리스트 만들기
	public List<String> makeMatcherList(String regex,String content) {
		Matcher matcher = Pattern.compile(regex).matcher(content);
		List<String> list = new ArrayList<String>();
		
		while(matcher.find()) {
			list.add(matcher.group());
		}
		return list;
	}
}
