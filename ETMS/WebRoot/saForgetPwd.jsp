<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ include file="/common/common.jspf"%>
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
	var isUser;
	var issleep = 0;
	var time;
		function checkUserName(userName){
			isUser = 0;
			if(userName.length != 11){
				document.getElementById("p1").innerHTML = "·请输入11位手机号！";
			}else {
				checkRegister(userName);
			}
		}
		function checkPwd(userPsw,userPsw2){
			if(userPsw2.length <6){
				document.getElementById("p1").innerHTML = "·密码长度应为6-20位！";
			}else if(userPsw != userPsw2){
				if(userPsw.length != 0){
					document.getElementById("p1").innerHTML = "·两次密码不相同！";
				}else document.getElementById("p1").innerHTML = "&nbsp;";
			}else {
				document.getElementById("p1").innerHTML = "&nbsp;";
			}
		}
		function checkCode(code){
			if(code.length != 4){
				document.getElementById("p1").innerHTML = "·请输入4位验证码！";
			}else {
				document.getElementById("p1").innerHTML = "&nbsp;";
			}
		}
		function checkRegister(userName){
			$.post("saUser/checkRegister.action",{userName:userName},function(response){checkedUser(response);});
		}
		function getCode(userName){
			/* document.getElementById("btn1").click(); */
			if(userName.length == 0){
				document.getElementById("p1").innerHTML = "·请输入手机号！";
			}else if(userName.length < 11){
				document.getElementById("p1").innerHTML = "·请输入11位手机号！";
			}else if(isUser == 1){
				if(issleep == 0){
					$.post("saUser/getStatusCode.action",{userName:userName},function(response){sendCode(response);});
					issleep = 1;
					time = 60;
					timeDown();
				}
			}else document.getElementById("p1").innerHTML = "·该用户没有注册权限！";
		}
		function checkedUser(result){
			if(result == 1){
				document.getElementById("p1").innerHTML = "·允许注册！";
				isUser = 1;
			}else{
				document.getElementById("p1").innerHTML = "·该用户没有注册权限！";
				isUser = 0;
			}
		}
		function sendCode(result){
			if(result == '00000'){
				document.getElementById("p1").innerHTML = "·验证码已发送！";
			}
		}
		function timeDown(){
			document.getElementById("btn1").innerHTML = "等待"+time+"秒后重试";
			if(time == 0){
				issleep = 0;
				document.getElementById("btn1").innerHTML = "发送验证码";
			}else{
				time--;
				setTimeout(function(){
					timeDown();
				}, 1000)
			}
		}
		function setRegister(){
			var userName = document.getElementById("RuserName").value;
			var userPsw1 = document.getElementById("RpassWord").value;
			var userPsw2 = document.getElementById("RpassWord2").value;
			var code = document.getElementById("VerificationCode").value;
			if(userName.length == 0){
				document.getElementById("p1").innerHTML = "·请输入手机号！";
			}else if(userName.length != 11){
				document.getElementById("p1").innerHTML = "·请输入11位手机号！";
			}else if(isUser!= 1){
				document.getElementById("p1").innerHTML = "·该用户没有注册权限！";
			}else if(userPsw1.length < 6 || userPsw2.length < 6){
				if(userPsw1.length == 0 || userPsw2.length == 0){
					document.getElementById("p1").innerHTML = "·请输入密码！";
				}else document.getElementById("p1").innerHTML = "·密码长度应为6-20位！";
			}else if(userPsw1 != userPsw2){
				document.getElementById("p1").innerHTML = "·两次密码不相同！";
			}else if(code.length != 4){
				document.getElementById("p1").innerHTML = "·请输入4位验证码！";
			}else if(isUser == 1){
				$.post("saUser/resetUserPsw.action",{userName:userName,userPsw:userPsw1,code:code},function(response){finish(response);});
			}else document.getElementById("p1").innerHTML = "·密码重置失败，请重新设置！";
		}
		function finish(result){
			if(result == 0){
				document.getElementById("p1").innerHTML = "·验证码错误！";
			}else if(result == 1){
				alert("密码重置成功！");
				window.location.href="login.jsp";
			}
		}
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
                    <h2>欢迎使用 <strong>工业互联网网关系统</strong></h>
                </div>
             </div>
        
			<div class="col-sm-5">
                <form name="form1" method="post">
				<h2 align="center" >密码重置</h2>
                    <input id="RuserName" type="text" name="RuserName" class="form-control userName" placeholder="用户名" required="true" maxlength="11" 
					onkeyup="checkUserName(this.value)" onchange="checkUserName(this.value)" style="color: black"/>
                    <input id="RpassWord" type="password" name="RpassWord" class="form-control pword m-b" placeholder="新密码" required="true" maxlength="20" 
					onkeyup="checkPwd(form1.RpassWord2.value,this.value)" style="color: black"/>
					<input id="RpassWord2" type="password" name="RpassWord2" class="form-control pword m-b" placeholder="确认密码"  required="true" maxlength="20" 
					onkeyup="checkPwd(form1.RpassWord.value,this.value)" style="color: black"/>
					<input id="VerificationCode" type="text" name="VerificationCode" class="form-control m-b" placeholder="验证码" required="true" maxlength="4" 
					onkeyup="checkCode(this.value);" style="color: black"/>
					<p id="p1">&nbsp;</p>
                    <button id="btn1" name="btn1" onClick="getCode(form1.RuserName.value)" type="button" class="btn btn-success btn-block">发送验证码</button>
					<button id="btn2" name="btn2" onClick="setRegister()" type="button" class="btn btn-success btn-block">重置</button>
					<hr>
					<p><a href="login.jsp">返回登陆页面</a></p>					
                </form>
             </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2018 xxxxx有限公司.
            </div>
        </div>
    
</body>
</html>