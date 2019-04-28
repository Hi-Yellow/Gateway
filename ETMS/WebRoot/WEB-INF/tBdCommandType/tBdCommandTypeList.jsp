<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端命令管理</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdCommandType/selectPageUseDyc.action', 				    
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
							title :'终端命令管理',						
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/tBdCommandType/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
							title :'电梯终端管理',
						    width:600,    
						    height:400,
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮    
						    modal:true,
						    content:"<iframe src='base/goURL/tBdCommandType/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
									  url: "tBdCommandType/deleteList.action",
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
				},],		       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'commandCode',
						title : '命令码',
						align : 'center',
						width : fixWidth(0.3)
					}, {
						field : 'typeName',
						title : '操作命令',
						align : 'center',
						width : fixWidth(0.3),
					}, {
						field : 'commandText',
						title : '操作内容',
						align : 'center',
						width : fixWidth(0.3),
		
					}]]
				});
 		}); 
	</script>	
</head>
<body>	
	<table id="dg"></table>
	<div id='win' ></div>
</body>
</html>
