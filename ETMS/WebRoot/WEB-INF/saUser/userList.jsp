<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>员工列表</title>
    <%@include file="/common/common.jspf"%>  <!--将其他的jsp页面引入到当前页面中，在当前页面可以直接调用-->
    <base href="${basePath }">    <!--为页面上所有相对 URL 规定基准 URL-->
    
    <script type="text/javascript">

		$(function(){		
			$('#dg').datagrid({    
			    url:'saUser/selectPageUseDyc.action', 				    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'id',
			    rownumbers:true,
			    striped:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[2,5,10,20],							    
			    toolbar: [{
					iconCls: 'icon-add',
					text:'新增',
					handler: function(){			
						$('#win').window({    
							title :'添加员工',						
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/saUser/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'修改',
					handler: function(){
						//判断是否选中一行，并且只能选中一行进行修改
						var array = $('#dg').datagrid("getSelections");
						if(array.length!=1){
							alert("请选择需要修改的记录，并且只能选中一条！");
							return false;							
						}							
						//打开修改窗口
						$('#win').window({    
							title :'编辑员工',
						    width:600,    
						    height:400,
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮    
						    modal:true,
						    content:"<iframe src='base/goURL/saUser/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 							
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){																
							//定义数组，通过下边的用来存储选中记录的username
							var ids = new Array();
							for (i = 0; i < array.length; i++) {
								ids[i] = array[i].userName;
							}
							//如果需要锁整个页面，前面加parent.
							$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
								if (r) {
									$.ajax({
									  url: "saUser/deleteList.action",
									  type:"POST",
									  //设置为传统方式传送参数
									  traditional:true,
									  data:{pks:ids},
									  success: function(html){
										  if(html>0){
										  	alert("恭喜您 ，删除成功，共删除了"+html+"条记录");
										  	//重新刷新页面
										    $("#dg").datagrid("reload");
										  }else{
										  	alert("对不起 ，删除失败");
										  }
									  	//请除所有勾选的行
									  	$("#dg").datagrid("clearSelections");
									  },
									  error: function (XMLHttpRequest, textStatus, errorThrown) {
										    $.messager.alert('删除错误','请联系超级管理员！','error');
									  }
									});
								}
							});
						}else{
							alert("请选择需要删除的记录！");
						}		
					}
				},'-',{
					text:"<input id='ss' type='text'></input>",				
				}],			       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'userName',
						title : '用户名',
						align : 'center',
						width : fixWidth(0.1)
					}, {
						field : 'realName',
						title : '姓名',
						align : 'center',
						width : fixWidth(0.1)
					},{
						field : 'roleName',
						title : '用户类型',
						align : 'center',
						width : fixWidth(0.1),
						formatter:function(value,row){
							return row.role.roleName;
						}
					}, {
						field : 'flag',
						title : '是否启用',
						align : 'center',
						width : fixWidth(0.1),
						formatter:function(value){
							return value==0 ?'停用':'启用';
						} 
					}, {
						field : 'memo',
						title : '备注',
						align : 'center',
						width : fixWidth(0.2)
					}]]
				});
			
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					if(name=='userName'){
						$('#dg').datagrid('load',{
							userName:'%'+value+'%'		
						});
					}
					if(name=='realName'){
						$('#dg').datagrid('load',{
							realName:'%'+value+'%'		
						});
					}
				},
				width:250, 
				menu:'#mm',				 
				prompt:'请输入搜索内容' 
				});
 		}); 
	</script>	
</head>
<body>	
	<table id="dg"></table>
	<div id='win'></div>
	<div id="mm" style="width:80px"> 
		<div data-options="name:'userName'">用户名</div>
		<div data-options="name:'realName'">姓名</div> 
	</div>
</body>
</html>


<%-- <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  
    <title>工业互联网网关系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <table border="1">
		<tr>
			<th>用户名</th>
			<th>姓名</th>
			<th>用户类型</th>
			<th>是否启用</th>
			<th>备注</th>
		</tr>
			<c:forEach items="${requestScope.users}" var="user">
			<tr>
				<!-- <td><img src=images/${book.image} height="60"></td> -->
				<td>${sessionScope.user.username}</td>
				<td>${sessionScope.user.realname}</td>
				<td>${sessionScope.user.role.id}</td>
				<td>${sessionScope.user.flag}</td>
				<td>${sessionScope.user.memo}</td>
			</tr>
			<!-- </c:forEach> -->
	</table>
</html>
 --%>