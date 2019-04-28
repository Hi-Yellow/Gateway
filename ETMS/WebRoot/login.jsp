<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
  <head>
    <%@include file="/common/common.jspf"%>
    <base href="<%=basePath%>">  
    <title>工业互联网网关系统</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="工业互联网网关系统">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">	
    
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
	
  </head>

  <body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ ETMS ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h2>欢迎使用 <strong>工业互联网网关系统</strong></<h2>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="saUser/login.action">
                    <input type="text" name="userName" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="userPsw" class="form-control pword m-b" placeholder="密码"/>
                    <div>
                    	<a href="saForgetPwd.jsp">忘记密码？</a> <a href="saRegister.jsp" style="float:right;">注册</a>
                    </div>                                                        
                    <font color="red">${requestScope.message}</font>
                    <button class="btn btn-success btn-block">登录</button>                         
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                <h3><strong>&copy;2018 xxxxx有限公司.</strong></h3>
            </div>
        </div>
    </div>
</body>

</html>
