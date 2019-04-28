package com.etms.core.filter;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.etms.user.pojo.User;

@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    public LoginFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;		
		HttpSession session = servletRequest.getSession();

		String requestURI = servletRequest.getRequestURI();
		// 登陆,注册,忘记密码页面无需过滤
		if (requestURI.indexOf("/login.jsp") > -1||requestURI.indexOf("/saRegister.jsp") > -1
				||requestURI.indexOf("/saForgetPwd.jsp") > -1||requestURI.indexOf("/sessionrun.jsp") > -1
				||requestURI.indexOf("/repeatLogin.jsp") > -1) {			
			// 放行			
			chain.doFilter(request, response);
			return;
		}/* else if(requestURI.indexOf("/saLogin.action") > -1||requestURI.indexOf("/saRegister.action") > -1||requestURI.indexOf("/saForgetPwd.action") > -1||requestURI.indexOf("/getStatusCode.action") > -1){
			chain.doFilter(request, response);
			return;
		}*/
		else {
			//获取session中的员工
			User user = (User)session.getAttribute("user");
			// 判断如果没有取到员工信息,就跳转到登陆页面
			if (user == null) {
				//如果判断是 AJAX 请求,直接设置为session超时
				if( servletRequest.getHeader("x-requested-with") != null 
		                && servletRequest.getHeader("x-requested-with").equals("XMLHttpRequest")  ) {

		             servletResponse.setHeader("sessionstatus", "timeout");  
		             servletResponse.sendError(518, "session timeout.");  

		        } else{
		             servletResponse.sendRedirect(
		            		servletRequest.getSession().getServletContext().getContextPath() 
		                    + "/sessionrun.jsp");
		        }   
			}else {
				String phone = ((User)session.getAttribute("user")).getUserName();
				ServletContext context = session.getServletContext();
				String newID = (String) context.getAttribute(phone);  //通过手机号(键)获得对应的ID(值)
				String oldID = session.getId();
				if(oldID.equals(newID)){
					
				}else {
					session.invalidate();
					if( servletRequest.getHeader("x-requested-with") != null 
			                && servletRequest.getHeader("x-requested-with").equals("XMLHttpRequest")  ) {

						servletResponse.setHeader("sessionstatus", "notimeout");  
						servletResponse.sendError(500, "repeat login.");  

			        } else{
			        	servletResponse.sendRedirect(
			            		servletRequest.getSession().getServletContext().getContextPath() 
			                    + "/repeatLogin.jsp");
			        }
				}
			}
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
