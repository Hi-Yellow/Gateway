<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端基本信息</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdTerminal/selectPageUseDyc.action', 				    
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
							title :'终端基本信息',						
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/tBdTerminal/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
							title :'终端基本信息',
						    width:600,    
						    height:400,
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮    
						    modal:true,
						    content:"<iframe src='base/goURL/tBdTerminal/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 							
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除',
					handler: function(){
						var array = $('#dg').datagrid("getSelections");
						if(array.length>0){																
							//定义数组，通过下边的用来存储选中记录
							var ids = new Array();
							for (i = 0; i < array.length; i++) {
								ids[i] = array[i].id;
							}
							//如果需要锁整个页面，前面加parent.
							$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
								if (r) {
									$.ajax({
									  url: "tBdTerminal/deleteList.action",
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
						field : 'terminalCode',
						title : '终端ID',
						align : 'center',
						width : fixWidth(0.5)
					}, {
						field : 'typeName',
						title : '终端类型',
						align : 'center',
						width : fixWidth(0.3),
	
					},  {
						field : 'mdn',
						title : '电话号码',
						align : 'center',
						width : fixWidth(0.3),
		
					}, {
						field : 'protocolName',
						title : '终端协议',
						align : 'center',
						width : fixWidth(0.3),
						
					}, {
						field : 'manufacturingUnit',
						title : '生产厂商',
						align : 'center',
						width : fixWidth(0.3),
					}, {
						field : 'terminalModel',
						title : '终端型号',
						align : 'center',
						width : fixWidth(0.3)
					},{
						field : 'softwareVersion',
						title : '终端软件版本',
						align : 'center',
						width : fixWidth(0.3),

					}, {
						field : 'hardwareVersion',
						title : '终端硬件版本',
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
</body>
</html>
