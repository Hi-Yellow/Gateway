<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>终端执行操作命令</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
</head>
<body class="mybody">

	<form id="ff" class="myfm" method="post">
	   	<table>
		<tr class="myfitem3">
			<td><label for="terminalCode">终端ID *:</label></td> 
			<td><input id="terminalCode" name="terminalCode" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="commandCode">操作命令*:</label></td>
			<td><input id='commandCode' name='commandCode'  /></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="commandText">操作内容:</label></td> 
			<td><textarea id="commandText" name="commandText" style="height:40px"></textarea></td>
		</tr>
		
		
		<tr class="myfitem3">
			<td><a id="btn" class="easyui-linkbutton" 
				data-options="iconCls:'icon-ok'">提交</a></td>  
			<td><a id="btn2" class="easyui-linkbutton" 
				data-options="iconCls:'icon-cancel'" 
				onclick="javascript:parent.$('#win').window('close');" style="float: right">关闭</a></td>  
		</tr>
		</table>
	</form>

	<script type="text/javascript">
	var time=15;
		$(function() {
			
			$('#terminalCode').combobox({    
			    url:'tBdTerminal/selectAll.action',
			    required : true,
				missingMessage : '请选择终端ID！',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'terminalCode',    
			    textField:'terminalCode',
			});
			
			$('#commandCode').combobox({    
			    url:'tBdCommandType/selectAll.action',
			    required : true,
				missingMessage : '请选择终端类型！',
			    width: 200,	    
			    panelHeight: '200',    
			    valueField:'commandCode',    
			    textField:'typeName',
			    onSelect: function(record){
			    	$('#commandText').val(record.commandText);
			    }   
			});	
			$('#commandText').validatebox({});	
			});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdTerminalCommand/execute.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
							//可以定义为对应消息框
							if(count>0){
								alert("添加成功！");	
								parent.$("#win").window("close");
								parent.$("#dg").datagrid("reload");
								timeDown();								
							}else if(count==0){
								alert("添加失败！");
								parent.$("#win").window("close");
								parent.$("#dg").datagrid("reload");
							}
							
							
						}
					});
				}
			});
		function timeDown(){
			if(time >= 0){
				time--;
				parent.$("#dg").datagrid("reload");
				setTimeout(function(){
					timeDown();	
				}, 2000)
			}
		}
	</script>
</body>
</html>
