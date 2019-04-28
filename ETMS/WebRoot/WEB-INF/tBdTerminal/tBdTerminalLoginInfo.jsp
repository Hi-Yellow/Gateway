<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端登录信息</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdTerminalLoginInfo/selectPageUseDyc.action', 				    
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
						field : 'terminalCode',
						title : '终端ID',
						align : 'center',
						width : fixWidth(0.5)
					}, {
						field : 'typeName',
						title : '终端类型',
						align : 'center',
						width : fixWidth(0.3),
	
					},{
						field : 'loginTime',
						title : '登录时间',
						align : 'center',
						width : fixWidth(0.3),
						formatter: function(value) {
							return format(value);
							}
					},{
						field : 'logoutTime',
						title : '注销时间',
						align : 'center',
						width : fixWidth(0.3),
						formatter: function(value) {
							return format(value);
							}
					}]]
				});
			
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
					if(name=='terminalCode'){
						$('#dg').datagrid('load',{
							terminalCode:'%'+value+'%'		
						});
					}
					if(name=='typeName'){
						$('#dg').datagrid('load',{
							typeName:'%'+value+'%'		
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
	<table id="dg" ></table>
	<div id='win' ></div>
	<div id="mm" style="width:80px"> 
		<div data-options="name:'terminalCode'">终端ID</div>
		<div data-options="name:'typeName'">终端类型</div> 
	</div>
</body>
</html>
