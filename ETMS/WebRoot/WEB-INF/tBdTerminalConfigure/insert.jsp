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
	   	<table style="width: 371px; ">
		<tr class="myfitem3">
			<td><label for="configureAlias">配置别名*:</label></td> 
			<td><input type="text" name="configureAlias" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="parameterSet">核心参数集合*:</label></td> 
			<td><textarea name="parameterSet" style="height: 65px; "></textarea></td>
		</tr>			
		<tr class="myfitem3">           
			<td><label for="parameterLength">核心参数长度*:</label></td> 
			<td><input type="text" name="parameterLength" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="applicationCode">行业代码:</label></td> 
			<td><input type="text" name="applicationCode" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="heartBeat">连接心跳时长:</label></td> 
			<td><input type="text" name="heartBeat" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="dataTimeOut">消息超时时长:</label></td> 
			<td><input type="text" name="dataTimeOut" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="dataSendCount">消息重发次数:</label></td> 
			<td style="width: 175px; "><input type="text" name="dataSendCount" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="messageTimeOut">短消息超时时长:</label></td> 
			<td><input type="text" name="messageTimeOut" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="messageSendCount">短消息重发次数:</label></td> 
			<td><input type="text" name="messageSendCount" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="sleepTime">UIM卡ID:</label></td> 
			<td><input type="text" name="sleepTime" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="pppNumber">PPP拨号号码:</label></td> 
			<td><input type="text" name="pppNumber" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="pppUser">PPP用户名 :</label></td> 
			<td><input type="text" name="pppUser" /></td>
        </tr>
		<tr class="myfitem3">
			<td><label for="pppPsw">PPP密码:</label></td> 
			<td><input type="text" name="pppPsw" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="mdmsAddress">MDMS地址:</label></td> 
			<td><input type="text" name="mdmsAddress" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="mdmsTcp">MDMS_TCP端口:</label></td> 
			<td><input type="text" name="mdmsTcp" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="mdmsUdp">MDMS_UDP端口:</label></td> 
			<td><input type="text" name="mdmsUdp" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="dnsAddress">DNS服务器地址:</label></td> 
			<td><input type="text" name="dnsAddress" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="m2mNumber">M2M接入号:</label></td> 
			<td><input type="text" name="m2mNumber" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="applicationAddress">应用服务器地址:</label></td> 
			<td><input type="text" name="applicationAddress" /></td>
        </tr>
		<tr class="myfitem3">
			<td><label for="applicationPort">应用服务器端口:</label></td> 
			<td><input type="text" name="applicationPort" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="applicationNumber">行业应用的短信<br>特服号码:</label></td> 
			<td style="height: 49px; "><input type="text" name="applicationNumber" style="height: 63px; "/></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="uimPsw ">UIM卡密码 :</label></td> 
			<td><input type="text" name="uimPsw" /></td>
		</tr>
		<tr class="myfitem3">
			<td><label for="portSpeed">串口速率:</label></td> 
			<td><input type="text" name="portSpeed" /></td>
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
		
			$("[name='configureAlias']").validatebox({
				required : true,
				missingMessage : '请输入配置别名！'
			});			
		
			$("#ff").form("disableValidation");
		
		});
		
		$("#btn").click(function() {
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					$('#ff').form('submit', {
						url : 'tBdTerminalConfigure/insert.action',
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
