package com.etms.user.action;

import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.etms.core.action.BaseAction;
import com.etms.core.page.Page;
import com.etms.core.util.TimestampEditor;
import com.etms.loginInfo.service.LoginInfoService;
import com.etms.user.pojo.User;
import com.etms.user.service.UserService;

@Controller
@RequestMapping("/saUser")
public class UserAction extends BaseAction{
	@Resource
	private UserService userService;
	@Resource
	private LoginInfoService loginInfoService;
	
	//将前台传入的string类型日期转换为Timestamp类型日期(可解决前台http status 400问题)
	@InitBinder
	public void initBinder(WebDataBinder binder){       
		binder.registerCustomEditor(Timestamp.class, new TimestampEditor());
	   }
	
	@RequestMapping("/login")
	public String salogin(User user,HttpServletRequest request,HttpSession session) {
		User user_result = userService.login(user);
		if(user_result!=null){
			System.out.println(user_result.getRealName()+"登陆了系统。。。。。。。。。。。");
			//获取人员手机号
			String userName = user_result.getUserName();
			session.getServletContext().setAttribute(userName, session.getId());
			//获取人员手机号
			/*if(!("admin".equals(userName))){
				//取前三位+****+后四位,生产类似137****8982格式的手机号
				userName = userName.substring(0, 3)+"****"+userName.substring(7);				
			}*/
			int count = loginInfoService.loginInfo(user_result);
			session.setAttribute("userName", userName);
			session.setAttribute("user", user_result);
			return "redirect:/home.jsp";
		}
		else{
			request.setAttribute("message","用户名或密码错误,请重新登陆");
			return "forward:/login.jsp";
		}	
	}
	
	@RequestMapping("/saLogout")
	public String saLogout(HttpServletRequest request,HttpSession session) {
			int i = loginInfoService.logout((User)session.getAttribute("user"));
			session.invalidate();
			return "forward:/login.jsp";
		}	

	
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<User> page, User user) {
		page.setParamEntity(user);  
		Page<User> pageRes = userService.selectPageUseDyc(page);
		return pageRes.getPageMap();
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(User user) {
		int count = 0;
		try {
			count = userService.insert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(User user) {
		int count = 0;
		try {
			count = userService.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping("/deleteList")
	@ResponseBody
	public int deleteList(String[] pks) {
		int count = 0;
		try {
			count = userService.deleteList(pks);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	@RequestMapping(value="/checkRegister",method=RequestMethod.POST)
	@ResponseBody
	public int checkRegister(@RequestParam String userName) {
		int count = 0;
		try {
			count = userService.findUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@RequestMapping(value="/getStatusCode",method=RequestMethod.POST)
	@ResponseBody
	public String getStatusCode(@RequestParam String userName) {
		String statusCode = userService.getStatusCode(userName);
		return statusCode;
	}
	
	@RequestMapping(value="/saRegister",method=RequestMethod.POST)
	@ResponseBody
	public int register(@RequestParam String userName, @RequestParam String userPsw, @RequestParam String code) {
		int i = userService.register(userName,userPsw,code);
		return i;
	}
	
	@RequestMapping(value="/resetUserPsw",method=RequestMethod.POST)
	@ResponseBody
	public int resetPass(@RequestParam String userName, @RequestParam String userPsw, @RequestParam String code) {
		int i = userService.resetUserPsw(userName,userPsw,code);
		return i;
	}
	
	@RequestMapping("/updatePswByUserName")
	@ResponseBody
	public int updatePswByUserName(User user, String oldUserPsw, String newUserPsw) {
		int count = 0;
		try {
			count = userService.updatePswByUserName(user, oldUserPsw, newUserPsw);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
