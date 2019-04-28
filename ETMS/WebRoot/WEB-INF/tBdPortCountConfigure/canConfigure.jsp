<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>修改</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
    
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post">
		<h2>CAN配置</h2><hr>
	   	<table>
		<tr class="myfitem3">
			<td><label for="terminalCode">终端ID:</label></td> 
			<td><input type="text" id='terminalCode' name="terminalCode" readonly="readonly"/></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="portID">CAN号:</label></td>
			<td><input id='portID' name='portID' value="1"/></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="portName">CAN名:</label></td> 
			<td><input type="text" id="portName" name="portName"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="baudRate">波特率:</label></td> 
			<td><input type="text" id="baudRate" name="baudRate"></input></td>
		</tr>
		<tr class="myfitem3">
			<td><a id="btn" class="easyui-linkbutton" 
				data-options="iconCls:'icon-ok'">提交</a></td>  
			<td><a id="btn2" class="easyui-linkbutton" 
				data-options="iconCls:'icon-cancel'" 
				onclick="javascript:parent.$('#win').window('close');" style="float: right">关闭</a></td>  
		</tr>
	</form>

	<script type="text/javascript">
		$(function() {
			var row = parent.$('#dg').datagrid("getSelected");
			row.tBdPortCountConfigurePrivilegeStart = format(row.tBdPortCountConfigurePrivilegeStart);
			$('#terminalCode').val(row.terminalCode);
			$('#portID').combobox({    
			    url:'tBdCAN/selectByCode.action?terminalCode='+row.terminalCode,
			    required : true,
			    editable : false,
				missingMessage : '请选择CAN号！',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'portID',    
			    textField:'portID',
			    onSelect: function(record){
			    	$('#portName').val(record.portName);
			    	$('#baudRate').val(record.baudRate);
			    } 
			});	
			if(row.cancount==1){
				$('#portID').combobox('readonly');
			}	
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdCAN/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {
							//可以定义为对应消息框
							if(count>0){
								alert("提交成功！");	
							}else if(count==0){
								alert("提交失败！");
							}
							parent.$("#win").window("close");
							parent.$("#dg").datagrid("reload");
						}
					});
				}
			});
	</script>
</body>
</html>
