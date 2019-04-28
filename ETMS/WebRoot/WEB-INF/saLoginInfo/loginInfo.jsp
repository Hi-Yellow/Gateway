<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>登录日志</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath }">
    
    <script type="text/javascript">
    	var url = 'loginInfo/selectPageUseDyc.action';
		$(function(){		
			$('#dg').datagrid({    
			    url:url, 				    
			    fitColumns:true,
			    nowrapL:true,
			    idField:'id',
			    rownumbers:true,
			    striped:true,
			    pagination:true,
			    pageSize:10,
			    pageList:[2,5,10,20],							    
			    toolbar: [{
					text:"<input id='ss' type='text'></input>",				
				}],			       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'userName',
						title : '用户名',
						align : 'center',
						width : fixWidth(0.3),
						/* formatter: function(value,row) {
							return row.user.userName;
						} */
					},{
						field : 'realName',
						title : '姓名',
						align : 'center',
						width : fixWidth(0.2),
						/* formatter: function(value,row) {
							return row.user.realName;
						} */
					}, {
						field : 'loginTime',
						title : '登陆时间',
						align : 'center',
						width : fixWidth(0.3),
						formatter: function(value) {
							return format(value);
						}
					}, {
						field : 'logoutTime',
						title : '注销时间',
						align : 'center',
						width : fixWidth(0.3),
						formatter: function(value) {
							return value==null?"":format(value);
						}
					}]]
				});
			
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					
					if(name=='userName'){
						$('#dg').datagrid('load',{
							'userName':'%'+value+'%'		
						});
					}
					if(name=='realName'){
						$('#dg').datagrid('load',{
							'realName':'%'+value+'%'		
						});
					}
				
				} ,
				width:300, 
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