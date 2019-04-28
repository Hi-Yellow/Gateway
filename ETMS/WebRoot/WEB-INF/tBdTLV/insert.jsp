<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>新增</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
    
</head>
<body class="mybody">
	<form id="ff" class="myfm" method="post">
	   	<table>
		<tr class="myfitem3">
			<td><label for="terminalCode">终端ID:</label></td> 
			<td><input id='terminalCode' name="terminalCode" style="width:210px" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="terminalTypeID">终端类型:</label></td>
			<td><input id='terminalTypeID' name='terminalTypeID' style="width:210px" /></td>
		</tr>
		<!-- <tr class="myfitem3">
			<td><label for="upgradeID">版本ID:</label></td>
			<td><input id='upgradeID' name='upgradeID' style="width:210px" /></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="upgradeVersion">版本号:</label></td> 
			<td><input type="text" name="upgradeVersion" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="uri">服务器URL:</label></td> 
			<td><input type="text" name="uri" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="downloadUsername">下载用户名:</label></td> 
			<td><input type="text" name="downloadUsername" style="width:210px"></input></td>
		</tr>
		<tr class="myfitem3">           
			<td><label for="downloadPassword">下载用户密码:</label></td> 
			<td><input type="text" name="downloadPassword" style="width:210px"></input></td>
		</tr> -->
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
			$('#terminalCode').combobox({
			    url:'tBdTerminal/selectAll.action',
			    editable : false,
			    required : true,
				missingMessage : '请选择终端ID！',
			    width: 210,	    
			    panelHeight: 'auto',    
			    valueField:'terminalCode',    
			    textField:'terminalCode',
			    onSelect:function(record){
			    	$('#terminalTypeID').combobox('setValue',record.terminalTypeId);
			    },
			});
			$('#terminalTypeID').combobox({    
			    url:'tBdTerminalType/selectAll.action',
			    readonly:true,
			    width: 210,	    
			    panelHeight: 'auto',    
			    valueField:'typeId',    
			    textField:'typeName',
			});	
		});	
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdTLV/insert.action',
						onSubmit : function() {
							return true;
						},
						success : function(count) {							
							//可以定义为对应消息框
							if(count>0){
								alert("添加成功！");						
							}else if(count==0){
								alert("添加失败！");
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
