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
	   	<table>
		<tr class="myfitem3">
			<td><label for="terminalCode">终端ID:</label></td> 
			<td><input id='terminalCode' name="terminalCode" style="width:210px" readonly="readonly"/></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="terminalTypeID">终端类型:</label></td>
			<td><input id='terminalTypeID' name='terminalTypeID' style="width:210px" readonly="readonly"/></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for=terminalConfigureID>配置类型:</label></td> 
			<td><input id="terminalConfigureID" name="terminalConfigureID" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="cancount">CAN数:</label></td> 
			<td><input type="text" name="cancount" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="networkPortCount">网口数:</label></td> 
			<td><input type="text" name="networkPortCount" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="rs232Count">RS232串口数:</label></td> 
			<td><input type="text" name="rs232Count" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="rs485Count">RS485串口数:</label></td> 
			<td><input type="text" name="rs485Count" style="width:210px"></input></td>
		</tr>
		</table>
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
			$('#terminalCode').combobox({
			    url:'tBdTerminal/selectAll.action',
			    editable : false,
			    required : true,
				missingMessage : '请选择终端ID！',
			    width: 210,	    
			    panelHeight: 'auto',    
			    valueField:'terminalCode',    
			    textField:'terminalCode',
			});
			$('#terminalTypeID').combobox({    
			    url:'tBdTerminalType/selectAll.action',
			    readonly:true,
			    width: 210,	    
			    panelHeight: 'auto',    
			    valueField:'typeId',    
			    textField:'typeName',
			});	
			$('#terminalConfigureID').combobox({    
			    url:'tBdTerminalConfigure/selectIDAndAlias.action',
			    required : true,
			    editable : false,
				missingMessage : '请选择配置类型！',
			    width: 210,	    
			    panelHeight: 'auto',    
			    valueField:'id',    
			    textField:'configureAlias',
			});
			$('#ff').form('load',row);	
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdPortCountConfigure/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
							//可以定义为对应消息框
							if(count>0){
								alert("修改成功！");						
							}else if(count==0){
								alert("修改失败！");
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
