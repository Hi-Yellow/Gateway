<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>终端命令下发</title>
    <%@include file="/common/common.jspf"%>
    <base href="${basePath}">
    
    <script type="text/javascript">
    var Reg = /[A-E][1-9]+/;
		$(function(){		
			$('#dg').datagrid({    
			    url:'tBdTerminalCommand/selectExecutePageUseDyc.action', 				    
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
							title :'终端命令',						
						    width:600,    
						    height:420, 
						    collapsible: false, //关闭可折叠按钮
						    minimizable:false, //关闭最小化按钮
						    maximizable: false,  //关闭最大化按钮   
						    modal:true,
						    content:"<iframe src='base/goURL/tBdTerminalCommand/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"  
						}); 
					}			
				},'-',{
					iconCls: 'icon-reload',
					text:'刷新',
					handler: function(){
							$('#dg').datagrid('load');
						}		
				}],			       				    	
				columns : [[{
						field: 'cb',
						checkbox: true
					},{
						field : 'terminalCode',
						title : '终端ID',
						align : 'center',
						width : fixWidth(0.3)
					},  {
						field : 'typeName',
						title : '操作命令',
						align : 'center',
						width : fixWidth(0.2),
	
					}, {
						field : 'commandText',
						title : '操作内容',
						align : 'center',
						width : fixWidth(0.2),
		
					}, {
						field : 'portConfigureInfo',
						title : '配置信息',
						align : 'center',
						width : fixWidth(0.2),
						formatter:function(value,row){
								if((Reg.test(row.commandText) && value!=null)||row.commandCode=="0B0B")
									return "<button onclick='goTo(\"showInfo\")'>查看详情</button>";
								else 
									return "";
							}
					}, {
						field : 'executeTime',
						title : '执行时间',
						align : 'center',
						width : fixWidth(0.3),
						formatter: function(value) {
							return format(value);
						}
					},{
						field : 'result',
						title : '执行返回',
						align : 'center',
						width : fixWidth(0.15)
					}, {
						field : 'executer',
						title : '执行人',
						align : 'center',
						width : fixWidth(0.2)
					}, {
						field : 'resultContent',
						title : '执行结果',
						align : 'center',
						width : fixWidth(0.15),
					}]]
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
			    content:"<iframe src='base/goURL/tBdTerminalCommand/"+data+".action' height='100%' width='100%' frameborder='0px'></iframe>"  
			});
		}	
	</script>	
</head>
<body>	
	<table id="dg" ></table>
	<div id='win' ></div>
</body>
</html>
