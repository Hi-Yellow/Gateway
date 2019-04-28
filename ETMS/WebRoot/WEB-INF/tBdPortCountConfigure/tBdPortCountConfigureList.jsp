<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端端口配置</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdPortCountConfigure/selectPageUseDyc.action',
			    fitColumns:true,
			    nowrapL:true,
			    idField:'id',
			    rownumbers:true,
			    striped:true,
			    ctrlSelect:true,  //支持shift多选
			    pagination:true,
			    pageSize:10,
			    pageList:[2,5,10,20],							    
			    toolbar: [{
					iconCls: 'icon-add',
					text:'新增',
					handler: function(){			
						$('#win').window({    
							title :'新增',
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/tBdPortCountConfigure/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
							title :'修改',
						    width:600,    
						    height:400,
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮    
						    modal:true,
						    content:"<iframe src='base/goURL/tBdPortCountConfigure/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
								ids[i] = array[i].terminalCode;
							}
							//如果需要锁整个页面，前面加parent.
							$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
								if (r) {
									$.ajax({
									  url: "tBdPortCountConfigure/deleteList.action",
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
						width : fixWidth(0.12)
					},  {
						field : 'typeName',
						title : '终端类型',
						align : 'center',
						width : fixWidth(0.08),
					}, {
						field : 'configureAlias',
						title : '配置类型',
						align : 'center',
						width : fixWidth(0.08),
					}, {
						field : 'rs485Count',
						title : 'RS485串口数',
						align : 'center',
						width : fixWidth(0.09),
					}, {
						field : 'RS485',
						title : 'RS485串口配置',
						align : 'center',
						width : fixWidth(0.09),
						formatter:function(value,row){
								if(row.rs485Count!=0&&row.rs485Count!=null)
									return "<button onclick='goTo(\"rs485Configure\")'>点击配置</button>";
								else return "";
							}
					}, {
						field : 'rs232Count',
						title : 'RS232串口数',
						align : 'center',
						width : fixWidth(0.09)
					}, {
						field : 'RS232',
						title : 'RS232串口配置',
						align : 'center',
						width : fixWidth(0.09),
						formatter:function(value,row){
								if(row.rs232Count!=0)
									return "<button onclick='goTo(\"rs232Configure\")'>点击配置</button>";
								else return "";
							}
					}, {
						field : 'networkPortCount',
						title : '网口数',
						align : 'center',
						width : fixWidth(0.09),
					}, {
						field : 'network',
						title : '网口配置',
						align : 'center',
						width : fixWidth(0.09),
						formatter:function(value,row){
								if(row.networkPortCount!=0&&row.networkPortCount!=null)
									return "<button onclick='goTo(\"networkPortConfigure\")'>点击配置</button>";
								else return "";
							}
					}, {
						field : 'cancount',
						title : 'CAN数',
						align : 'center',
						width : fixWidth(0.09),
		
					}, {
						field : 'can',
						title : 'CAN配置',
						align : 'center',
						width : fixWidth(0.09),
						formatter:function(value,row){
								if(row.cancount!=0&&row.cancount!=null)
									return "<button onclick='goTo(\"canConfigure\")'>点击配置</button>";
								else return "";
							}
					},{
						field : 'info',
						title : '查看详情',
						align : 'center',
						width : fixWidth(0.08),
						formatter:function(value,row){
								if(row.rs485Count+row.rs232Count+row.networkPortCount+row.cancount>0)
									return "<button onclick='goTo(\"showInfo\")'>查看详情</button>";
								else return "";
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
 		function goTo(data){
			$('#win').window({
				title :'配置',
			    width:600,    
			    height:400, 
			    collapsible: false, //关闭可折叠按钮
				minimizable:false, //关闭最小化按钮
				maximizable: true,  //开启最大化按钮   
			    modal:true,
			    content:"<iframe src='base/goURL/tBdPortCountConfigure/"+data+".action' height='100%' width='100%' frameborder='0px'></iframe>"  
			});
		}		
	</script>	
</head>
<body>	
	<table id="dg"></table>
	<div id='win'></div>
	<div id="mm" style="width:80px">
	  <div data-options="name:'terminalCode'">终端ID</div>
	  <div data-options="name:'typeName'">终端类型</div> 
	</div>
</body>
</html>
