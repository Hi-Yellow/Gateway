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
