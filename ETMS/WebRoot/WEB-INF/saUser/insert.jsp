<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>添加员工</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
</head>
<body class="mybody">

	<form id="ff" class="myfm" method="post">
	   	<table>
		<tr class="myfitem3">
			<td><label for="userName">用户名:</label></td> 
			<td><input type="text" name="userName" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="realName">姓名:</label></td> 
			<td><input type="text" name="realName" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="role.id">用户类型:</label></td>
			<td><input id="role" name='role.id'  /></td>
		</tr>
		<tr class="flag">
			<td><label for="flag">是否启用</label></td>
			<td>
                <select id="text" name="flag">
                       <option value="0" >停用</option>
                       <option value="1" selected="">启用</option>
                </select>
            </td>     
		</tr>		

		<tr class="myfitem3">
			<td><label for="memo">备注:</label></td> 
			<td><textarea name="memo"></textarea></td>
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
			$.extend($.fn.validatebox.defaults.rules, {
				mobile: {// 验证用户名
	                validator: function (value) {
	                    return /^(1[3-9])\d{9}$/i.test(value);
	                },
	                message: '手机号码格式不正确'
	            }
			});
			$("[name='userName']").validatebox({
				required : true,
				validType : 'mobile',
				missingMessage : '请填写用户名！'
			});			
			$("[name='realName']").validatebox({
				required : true,
				missingMessage : '请填写姓名！'
			});
			
			$('#role').combobox({    
			    url:'saRole/getRoleNameAndID.action',
			    required : true,
				missingMessage : '请选择用户类型！',
			    width: 200,	    
			    panelHeight: 'auto',    
			    valueField:'id',    
			    textField:'roleName',
			});
			
			$("[name='flag']").combobox({
				required : true,
				missingMessage : '请选择是否启用！',
				width: 200,	    
			    panelHeight: 'auto', 
			});
			$("#ff").form("disableValidation");
		
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'saUser/insert.action',
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
