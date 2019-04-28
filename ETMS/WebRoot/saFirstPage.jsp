<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端状态查询</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdTerminal/selectPageUseDyc.action', 				    
			    fitColumns:true,   	//使列自动展开或收缩列的宽度以适应网格的宽度，防止水平滚动
			    nowrapL:true,       //表格单元格中的内容不换行
			    idField:'id',		//指明哪一个字段是标识字段
			    rownumbers:true,    //显示一个行号列
			    striped:true,       //是否显示斑马线效果
			    pagination:true,    //在DataGrid控件底部显示分页工具栏
			    pageSize:10,        //在设置分页属性的时候初始化页面大小
			    pageList:[2,5,10,20],	//在设置分页属性的时候 初始化页面大小选择列表						    
			    toolbar: ['-',{
					text:"<input id='ss' type='text'></input>",				
				}],			       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'terminalCode',
						title : '终端ID',
						align : 'center',
						width : fixWidth(0.4)
					},  {
						field : 'typeName',
						title : '终端类型',
						align : 'center',
						width : fixWidth(0.2),
	
					}, {
						field : 'loginCount',
						title : '终端登录次数',
						align : 'center',
						width : fixWidth(0.15),
		
					}, /* {
						field : 'loginPsw',
						title : '登录密码',
						align : 'center',
						width : fixWidth(0.2),
					}, */{
						field : 'registerTime',
						title : '最近注册时间',
						align : 'center',
						width : fixWidth(0.2),
						formatter: function(value) {      //formatter 日期格式化函数，返回日期值
							return timeFormat(value);
						}	
					}, {
						field : 'loginTime',
						title : '最近登陆时间',
						align : 'center',
						width : fixWidth(0.2),
						formatter: function(value) {
							return timeFormat(value);
						}
					}, {
						field : 'statusName',
						title : '终端状态',
						align : 'center',
						width : fixWidth(0.3),
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
	<!-- <hr>
	<div style="width:100%" align="center"><br><br><h1><font size="7" color="red"><strong>欢迎使用工业互联网网关系统！</strong></font></h1></div> -->
</body>
</html>
