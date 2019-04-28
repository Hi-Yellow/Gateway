<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端资料</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdTerminalConfigure/selectPageUseDyc.action', 				    
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
							title :'基本信息配置',						
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/tBdTerminalConfigure/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
							title :'基本信息配置',
						    width:600,    
						    height:400,
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮    
						    modal:true,
						    content:"<iframe src='base/goURL/tBdTerminalConfigure/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
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
									  url: "tBdTerminalConfigure/deleteList.action",
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
					text:"<label>配置别名：</label><input id='ss' type='text'></input>",				
				}],			       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'configureAlias',
						title : '配置别名',
						align : 'center',
						width : fixWidth(0.2),
					}, {
						field : 'parameterSet',
						title : '核心参数集合',
						align : 'center',
						width : fixWidth(0.5),
					}, {
						field : 'parameterLength',
						title : '核心参数长度',
						align : 'center',
						width : fixWidth(0.3),
		
					}, {
						field : 'applicationCode',
						title : '行业代码',
						align : 'center',
						width : fixWidth(0.3),
					}, {
						field : 'heartBeat',
						title : '连接心跳时长',
						align : 'center',
						width : fixWidth(0.3)
					}, {
						field : 'dataTimeOut',
						title : '消息超时时长',
						align : 'center',
						width : fixWidth(0.3)
					}, {
						field : 'dataSendCount',
						title : '消息重发次数',
						align : 'center',
						width : fixWidth(0.3),

					}, {
						field : 'messageTimeOut',
						title : '短消息超时时长',
						align : 'center',
						width : fixWidth(0.35),

					}, {
						field : 'messageSendCount',
						title : '短消息重发次数',
						align : 'center',
						width : fixWidth(0.35)
					}, {
						field : 'sleepTime',
						title : '休眠时长',
						align : 'center',
						width : fixWidth(0.2)
					},{
						field : 'pppNumber',
						title : 'PPP拨号号码',
						align : 'center',
						width : fixWidth(0.3),

					}, {
						field : 'pppUser',
						title : 'PPP用户名',
						align : 'center',
						width : fixWidth(0.25),

					}, {
						field : 'pppPsw',
						title : 'PPP密码',
						align : 'center',
						width : fixWidth(0.25),
						
					}, {
						field : 'mdmsAddress',
						title : 'MDMS地址',
						align : 'center',
						width : fixWidth(0.4),
					}, {
						field : 'mdmsTcp',
						title : 'MDMS_TCP端口',
						align : 'center',
						width : fixWidth(0.35)
					},{
						field : 'mdmsUdp',
						title : 'MDMS_UDP端口',
						align : 'center',
						width : fixWidth(0.35),

					}, {
						field : 'dnsAddress',
						title : 'DNS服务器地址',
						align : 'center',
						width : fixWidth(0.4),

					}, {
						field : 'm2mNumber',
						title : 'M2M接入号',
						align : 'center',
						width : fixWidth(0.25),
					},{
						field : 'applicationAddress',
						title : '应用服务器地址',
						align : 'center',
						width : fixWidth(0.4),

					}, {
						field : 'applicationPort',
						title : '应用服务器端口',
						align : 'center',
						width : fixWidth(0.4),

					}, {
						field : 'applicationNumber',
						title : '行业应用的短信特服号码',
						align : 'center',
						width : fixWidth(0.5),

					}, {
						field : 'uimPsw',
						title : 'UIM卡密码',
						align : 'center',
						width : fixWidth(0.3),

					}, {
						field : 'portSpeed',
						title : '串口速率',
						align : 'center',
						width : fixWidth(0.3),
					}]]
				});
			
			$('#ss').searchbox({ 
				searcher:function(value,name){ 
						$('#dg').datagrid('load',{
							configureAlias:'%'+value+'%'		
						});
					
				},
				width:250, 			 
				prompt:'请输入搜索内容' 
				});
 		}); 
	</script>	
</head>
<body>	
	<table id="dg" style="width:3000"></table>
	<div id='win' ></div>
</body>
</html>
