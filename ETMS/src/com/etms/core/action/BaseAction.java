package com.etms.core.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/base")
public class BaseAction {
	@Resource
	ServletContext application;
		
	/**
	 * 统一处理请求action的跳转页面
	 * @param folder 通过@PathVariable从@RequestMapping的{folder}获取
	 * @param file	通过@PathVariable从@RequestMapping的{file}获取
	 * @return 跳转页面
	 */
	@RequestMapping("/goURL/{folder}/{file}")
	public String goURL(@PathVariable String folder,@PathVariable String file) {
		System.out.println("goURL.folder|file===" + folder+"/"+file);
		return "forward:/WEB-INF/"+folder+"/"+file+".jsp";
	}
}
