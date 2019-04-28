<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>终端管理</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
</head>
<body class="mybody">
	
	<form id="ff" class="myfm" method="post">
	
		<input type="text" name="id" hidden="hidden"/>
<table>
		<tr class="myfitem3">
			<td><label for="commandCode">命令码*:</label></td> 
			<td><input type="text" name="commandCode" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="typeName">操作命令*:</label></td>
			<td><input type="text" name="typeName" /></td>
        </tr>
		<tr class="myfitem3">           
			<td><label for="commandText">操作内容:</label></td> 
			<td><input type="text" name="commandText" style="height: 90px; "/></td>
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
			row.tBdTerminalTypePrivilegeStart = format(row.tBdTerminalTypePrivilegeStart);
			
			$("[name='commandCode']").validatebox({
				required : true,
				commandCode : '请输入命令码！'
			});			
			$("[name='typeName']").validatebox({
				required : true,
				typeName : '请输入操作命令！'
			});
			$("#ff").form("disableValidation");										     		       

			$('#ff').form('load',row);		
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdCommandType/update.action',
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
