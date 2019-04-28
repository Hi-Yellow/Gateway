<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">       
    <title>登陆提示</title>    		
  </head>

<body>
	<script language="JavaScript"> 
    alert("由于您长时间没有操作, 请重新登录."); 
    setTimeout(function () { 
      window.top.location.href="login.jsp"; 
    },200); 
  </script>
</body>

</html>
