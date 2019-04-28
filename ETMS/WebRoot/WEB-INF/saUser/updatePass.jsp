<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/common/common.jspf"%>

<html>
  <head>
    <base href="<%=basePath%>">
       
    <title>修改密码</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">
    <script type="text/javascript">
        function confirm()
        {
          	var oldPassWord=$("#s_oldPassWord").val();
         	var newPassWord=$("#s_passWord").val();
         	var newPassWord2=$("#s_passWord2").val();
         	if(oldPassWord==""||oldPassWord==null||newPassWord==""||newPassWord==null||newPassWord2==null||newPassWord2=="")
         	{
         		alert("旧密码或新密码不能为空！");
         		return false;
         	}  
         	if(newPassWord != newPassWord2) 
         	{
         		alert("两次密码输入不一致！");
         		return false;
         	}   
			if(newPassWord.length<6)
         	{
         		alert("密码长度不能少于6位！");
         		return false;
         	} 
         	$('#ff').form('submit', {    
			    url:'saUser/updatePswByUserName.action',    
			    onSubmit: function(param){    
			        param.userName='${sessionScope.user.userName}';
			        param.userPsw='${sessionScope.user.userPsw}';   
			    },    
			    success:function(data){    
			        if(data==1){
			        	alert("密码修改成功，请重新登陆！");
			        	window.location.href="login.jsp";
			        }else{
			        	alert("密码修改失败，请稍后再试！");
			        }    
			    },
			    error: function(){
			    	alert("密码修改失败，请稍后再试！");
			    }   
			});          	 	  	             				
        }	        			
    </script>	
	
  </head>

  <body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-5">
                <form id="ff" method="post">
                    <input type="password" id="s_oldPassWord" name="oldUserPsw" class="form-control pword m-b" placeholder="旧密码" />
                    <input type="password" id="s_passWord" name="newUserPsw" class="form-control pword m-b" placeholder="新密码" />
                    <input type="password" id="s_passWord2" class="form-control pword m-b" placeholder="确认密码" />                                                                        
                    <button class="btn btn-success btn-block" type="button" onclick="confirm()" >提交</button>                    
                </form>
            </div>
        </div>
    </div>
</body>

</html>
