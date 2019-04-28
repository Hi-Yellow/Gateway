package com.etms.core.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.etms.user.pojo.User;


public class SystemSessionInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		// 登陆,注册,忘记密码页面无需过滤
		if (requestURI.indexOf("/login.action") > -1||requestURI.indexOf("/saRegister.action") > -1||
				requestURI.indexOf("/saForgetPwd.action") > -1 || requestURI.indexOf("/checkRegister.action") > -1
				|| requestURI.indexOf("/getStatusCode.action") > -1 || requestURI.indexOf("/resetUserPsw.action") > -1) {					
			return true;
		}
		//获取session中的用户
		User user = (User)session.getAttribute("user");
		// 判断如果没有取到员工信息,就跳转到登陆页面
		if (user == null) {
			//如果判断是 AJAX 请求,直接设置为session超时
			if( request.getHeader("x-requested-with") != null 
	                && request.getHeader("x-requested-with").equals("XMLHttpRequest")  ) {

	             response.setHeader("sessionstatus", "timeout");  
	             response.sendError(518, "session timeout.");  

	        } else{
	            response.sendRedirect(
	                    request.getSession().getServletContext().getContextPath() 
	                    + "/sessionrun.jsp");
	        }   
            return false;
		}else {
			String phone = ((User)session.getAttribute("user")).getUserName();
			ServletContext context = session.getServletContext();
			String newID = (String) context.getAttribute(phone);
			String oldID = session.getId();
			if(oldID.equals(newID)){
				return true;
			}else {
				session.invalidate();
				if( request.getHeader("x-requested-with") != null 
		                && request.getHeader("x-requested-with").equals("XMLHttpRequest")  ) {

		             response.setHeader("sessionstatus", "notimeout");  
		             response.sendError(500, "repeat login.");  

		        } else{
		            response.sendRedirect(
		                    request.getSession().getServletContext().getContextPath() 
		                    + "/repeatLogin.jsp");
		        }
				return false;
			}
		}
	}	
}
