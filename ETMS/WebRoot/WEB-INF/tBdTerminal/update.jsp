<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>终端信息</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
</head>
<body class="mybody">
	
	<form id="ff" class="myfm" method="post">
	
		<input type="text" name="id" hidden="hidden"/>
<table>
		<tr class="myfitem3">
			<td><label for="terminalCode">终端ID*:</label></td> 
			<td><input id="terminalCode" name="terminalCode" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="terminalTypeId">终端类型*:</label></td>
			<td><input id='terminalTypeId' name='terminalTypeId'  /></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="mdn">电话号码:</label></td> 
			<td><input type="text" name="mdn" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="terminalProtocolId">终端协议*:</label></td> 
			<td><input id='terminalProtocolId' name="terminalProtocolId" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="manufacturingUnit">生产厂商:</label></td> 
			<td><input type="text" name="manufacturingUnit" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="terminalModel">终端型号:</label></td> 
			<td><input type="text" name="terminalModel" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="softwareVersion">终端软件版本:</label></td> 
			<td><input type="text" name="softwareVersion" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="hardwareVersion">终端硬件版本:</label></td> 
			<td><input type="text" name="hardwareVersion" /></td>
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
		$(function() {
		var row = parent.$('#dg').datagrid("getSelected");
			row.tBdTerminalPrivilegeStart = format(row.tBdTerminalPrivilegeStart);
			$('#terminalCode').combobox({
			    url:'tBdTerminal/selectAll.action',
			    required : true,
				missingMessage : '请选择终端ID！',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'terminalCode',    
			    textField:'terminalCode',
			});	
			$('#terminalTypeId').combobox({    
			    url:'tBdTerminalType/selectAll.action',
			    required : true,
				missingMessage : '请选择终端类型！',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'typeId',    
			    textField:'typeName',
			});	
			$('#terminalTypeId').combobox('select',row.terminalTypeId);   //回显
			
			$('#terminalProtocolId').combobox({    
			    url:'tBdTerminalProtocol/selectAll.action',
			    required : true,
				missingMessage : '请选择终端协议',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'protocolId',    
			    textField:'protocolName',
			});	
			$('#terminalProtocolId').combobox('select',row.terminalProtocolId);   //回显		
			//禁用验证
			$("#ff").form("disableValidation");										     		       

			$('#ff').form('load',row);		
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdTerminal/update.action',
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
