<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
   	 	<meta http-equiv="Cache-Control" content="no-siteapp" />	
		<title>工业互联网网关系统</title>
		
		<%@include file="/common/common.jspf"%>
		<base href="<%=basePath%>">
		<meta name="keywords" content="工业互联网网关系统">
	
	    <link rel="shortcut icon" href="favicon.ico">
	    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
	    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
	    <link href="css/animate.min.css" rel="stylesheet">
	    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
	   <!--  <script>
	    	function re_load(){
	    		$("*[name='iframe6']").attr('src','base/goURL/tBdTerminalCommand/tBdExecuteTerminalList.action');
	    	}
	    </script> -->
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                        	<span>
                            <c:set var="img" scope="session" value="img/saUser.png"/>
                            <img id="icon" alt="image" height="80px" width="80px" src="${img}" style="border-radius: 50%;"/>
                            </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"> <strong class="font-bold">${sessionScope.userName}</strong></span>
                                <span class="text-muted text-xs block" onclick="$('#updatePass').toggle();">${sessionScope.user.role.roleName}<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul id="updatePass" class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="base/goURL/saUser/updatePass.action" onclick="$('#updatePass').hide();">修改密码</a></li>
                                <li class="divider"></li>
                                <li><a href="saUser/saLogout.action">安全退出</a></li>
                            </ul>
                        </div>
                        <div class="logo-element">ETMS
                        </div>
                    </li>
                    <c:set var="userRole" scope="session" value="${sessionScope.user.role.id}"></c:set>  
                    <c:if test="${userRole!=1 }">                 
                   <li>
                        <a href="#">
                            <i class="fa fa-table"></i>
                            <span class="nav-label">基本资料</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">                        	
                            <c:if test="${userRole==3 }">
							<li>
                                <a class="J_menuItem" href="base/goURL/tBdTerminalConfigure/tBdTerminalConfigureInfoList.action">基本信息配置</a>
                            </li>
							</c:if> 
                          	<c:if test="${userRole==2 }">
                            <li>
                                <a class="J_menuItem" href="base/goURL/tBdTerminal/tBdTerminalList.action">终端基本信息</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="base/goURL/tBdTerminal/tBdTerminalLoginInfo.action">终端登录信息</a>
                            </li>
                          </c:if>                    
                        </ul>
                   </li>
                   <c:if test="${userRole==2 }">
                   <li>
                        <a href="#">
                            <i class="fa fa-gear"></i>
                            <span class="nav-label">终端配置</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level"> 
                            <li>
                                 <a class="J_menuItem" href="base/goURL/tBdTerminalConfigure/tBdTerminalConfigureInfoList.action">基本信息配置</a>
                            </li>
                            <li>
                               	 <a class="J_menuItem" href="base/goURL/tBdPortCountConfigure/tBdPortCountConfigureList.action">终端端口配置</a>
                            </li>
                             <li>
                               	 <a class="J_menuItem" href="base/goURL/tBdTLV/tBdTLVConfigureList.action">终端硬件升级</a>
                            </li>
                        </ul>
                   </li>
                    </c:if> 
                   <li>
                        <a href="#">
                            <i class="fa fa-gear"></i>
                            <span class="nav-label">远程管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                        	<c:if test="${userRole==2 }">
                            <li>
                                <a class="J_menuItem" href="base/goURL/tBdTerminalCommand/tBdExecuteTerminalList.action">执行终端命令</a>
                            </li>
                            </c:if>
                            <li>
                                <a class="J_menuItem" href="base/goURL/tBdTerminalCommand/tBdTerminalCommandList.action">历史命令查看</a>
                            </li>
                        </ul>
                   </li>
                   </c:if> 
                   <c:if test="${userRole==1}">
                   <li>
                        <a href="#">
                            <i class="fa fa-user"></i>
                            <span class="nav-label">人员管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="J_menuItem" href="base/goURL/saUser/userList.action">用户管理</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="base/goURL/saLoginInfo/loginInfo.action">登录日志</a>
                            </li>
                        </ul>
                   </li>
                   <li>
                        <a href="#">
                            <i class="fa fa-gear"></i>
                            <span class="nav-label">基本资料</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level"> 
                            <li>
                            	<a class="J_menuItem" href="base/goURL/tBdTerminalConfigure/tBdTerminalConfigureList.action">基本信息配置</a>
                            </li>
                            <li>
                                <a class="J_menuItem" href="base/goURL/tBdCommandType/tBdCommandTypeList.action">终端命令配置</a>
                            </li>
                        </ul>
                   </li>
                   </c:if>
                </ul>
             </div>
         </nav>     
     <!--左侧导航结束-->
      <!--右侧部分开始-->
      <div id="page-wrapper" class="gray-bg dashbard-1">
          <div class="row border-bottom">
              <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                  <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary "><i class="fa fa-bars"></i> </a>
                      <form role="search" class="navbar-form-custom" method="post" action="">
                          <div class="form-group">
                              <input type="text" hidden="hidden" class="form-control" name="top-search" id="top-search">
                          </div>
                      </form>
                  </div>                  
              </nav>
          </div>
          <div class="row content-tabs">
              <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
              </button>
              <nav class="page-tabs J_menuTabs">
                  <div class="page-tabs-content">
                      <a href="saFirstPage.jsp" target="iframe0" class="active J_menuTab">首页</a>
                  </div>
              </nav>
              <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
              </button>
              <div class="btn-group roll-nav roll-right">
                  <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                  </button>
                  <ul role="menu" class="dropdown-menu dropdown-menu-right">
                      <li class="J_tabShowActive"><a>定位当前选项卡</a>
                      </li>
                      <li class="divider"></li>
                      <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                      </li>
                      <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                      </li>
                  </ul>
              </div>
              <a href="saUser/saLogout.action" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
          </div>
          <div class="row J_mainContent" id="content-main">
              <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="saFirstPage.jsp" frameborder="0" seamless></iframe>
          </div>
          <div class="footer">
              <div class="pull-right">&copy; 2018-2019 <a href="http://" target="_blank">工业互联网网关系统</a>
              </div>
          </div>
      </div>
      <!--右侧部分结束-->
	</div>
     
     <script src="js/bootstrap.min.js?v=3.3.6"></script>
     <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
     <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
     <script src="js/plugins/layer/layer.min.js"></script>
     <script src="js/hplus.min.js?v=4.1.0"></script>
     <script type="text/javascript" src="js/contabs.min.js"></script>
     <script src="js/plugins/pace/pace.min.js"></script>
</body>                   

</html>
