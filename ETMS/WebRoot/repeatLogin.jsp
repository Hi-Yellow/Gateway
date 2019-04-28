<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
  	<%@ include file="/common/common.jspf"%>
    <base href="<%=basePath%>">       
    <title>登陆提示</title>    		
  </head>

<body>
	<script language="JavaScript"> 
    alert("您的账号已在其他地方登录，您已被迫下线。"); 
    setTimeout(function () { 
      window.top.location.href="login.jsp"; 
    },200); 
  </script>
</body>

</html>
