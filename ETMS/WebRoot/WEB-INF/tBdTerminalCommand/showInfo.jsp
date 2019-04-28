<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>端口详情</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
    
</head>
<body class="mybody" id="mybody">
	<script type="text/javascript">
		$(function() {
			var row = parent.$('#dg').datagrid("getSelected");
			row.tBdPortCountConfigurePrivilegeStart = format(row.tBdPortCountConfigurePrivilegeStart);
			var form = "class='myfm'";
			rs485Title2 = "<h4 style='clear:both;'>RS485串口</h4><hr>";
			rs232Title2 = "<h4 style='clear:both;'>RS232串口</h4><hr>";
			canTitle2 = "<h4 style='clear:both;'>CAN</h4><hr>";
			networkTitle2 = "<h4 style='clear:both;'>网口</h4><hr>";
			tlvTitle2 = "<h4 style='clear:both;'>硬件升级</h4><hr>";
			if(row.commandCode=="0B0B"){
			$('#mybody').append(
						"<form id='tlvff' "+form+">"
						+tlvTitle2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='upgradeID'>升级ID:</label></td>"
							+"<td><input name='upgradeID' style='width:200px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='upgradeVersion'>升级版本:</label></td>" 
							+"<td><input type='text' name='upgradeVersion' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='uri'>硬件IP:&nbsp;&nbsp;&nbsp;</label></td>"
							+"<td><input type='text' name='uri' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='downloadUsername'>下载用户名:</label></td> "
							+"<td><input type='text' name='downloadUsername' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='downloadPassword'>下载用户密码:</label></td> "
							+"<td><input type='text' name='downloadPassword' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"
					);
					var info = row.portConfigureInfo.split(";$");
					$("*[name='upgradeID']").val(info[0]=='null'?"":info[0]);
					$("*[name='upgradeVersion']").val(info[1]);
					$("*[name='uri']").val(info[2]);
					$("*[name='downloadUsername']").val(info[3]);
					$("*[name='downloadPassword']").val(info[4]);
					
			}
			if(row.commandText.substring(0, 1)=="A"){
					$('#mybody').append(
						"<form id='rs485ff' "+form+">"
						+rs485Title2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>串口号:</label></td>"
							+"<td><input name='portID' style='width:200px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>串口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='baudRate'>波特率:&nbsp;&nbsp;&nbsp;</label></td>"
							+"<td><input type='text' name='baudRate' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='stopBit'>停止位:</label></td> "
							+"<td><input type='text' name='stopBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='checkBit'>校验位:</label></td> "
							+"<td><input type='text' name='checkBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='dataBit'>数据位:</label></td> "
						+"<td><input type='text' name='dataBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"
					);
					$("*[name='portID']").val(row.commandText.substring(1));
					var info = row.portConfigureInfo.split(";$");
					$("*[name='portName']").val(info[0]);
					$("*[name='baudRate']").val(info[1]=='null'?"":info[1]);
					$("*[name='stopBit']").val(info[2]=='null'?"":info[2]);
					$("*[name='checkBit']").val(info[3]);
					$("*[name='dataBit']").val(info[4]=='null'?"":info[4]);
					
			}
			if(row.commandText.substring(0, 1)=="B"){
					$('#mybody').append(
						"<form id='rs232ff' "+form+">"
						+rs232Title2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>串口号:</label></td>"
							+"<td><input name='portID' style='width:200px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>串口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='baudRate'>波特率:&nbsp;&nbsp;&nbsp;</label></td>"
							+"<td><input type='text' name='baudRate' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='stopBit'>停止位:</label></td> "
							+"<td><input type='text' name='stopBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='checkBit'>校验位:</label></td> "
							+"<td><input type='text' name='checkBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='dataBit'>数据位:</label></td> "
						+"<td><input type='text' name='dataBit' style='width:200px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"
					);
					$("*[name='portID']").val(row.commandText.substring(1));
					var info = row.portConfigureInfo.split(";$");
					$("*[name='portName']").val(info[0]);
					$("*[name='baudRate']").val(info[1]=='null'?"":info[1]);
					$("*[name='stopBit']").val(info[2]=='null'?"":info[2]);
					$("*[name='checkBit']").val(info[3]);
					$("*[name='dataBit']").val(info[4]=='null'?"":info[4]);
					
			}
			if(row.commandText.substring(0, 1)=="C"){
					$('#mybody').append(
						"<form id='networkPortff' "+form+">"
						+networkTitle2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>网口号:</label></td>"
							+"<td><input name='portID' style='width:200px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>网口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"           
							+"<td><label for='ipAddress'>IP地址:</label></td>" 
							+"<td><input type='text' name='ipAddress' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"         
							+"<td><label for='gateway'>网关:</label></td>"
							+"<td><input type='text' name='gateway' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='netmask'>子网掩码:</label></td>"
							+"<td><input type='text' name='netmask' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"
					);
					$("*[name='portID']").val(row.commandText.substring(1));
					var info = row.portConfigureInfo.split(";$");
					$("*[name='portName']").val(info[0]);
					$("*[name='ipAddress']").val(info[1]);
					$("*[name='gateway']").val(info[2]);
					$("*[name='netmask']").val(info[3]);
					
			}
			
			if(row.commandText.substring(0, 1)=="D"){
					$('#mybody').append(
						"<form id='canff' "+form+">"
						+canTitle2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>CAN号:</label></td>"
							+"<td><input name='portID' style='width:200px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"       
							+"<td><label for='portName'>CAN名:&nbsp;&nbsp;&nbsp;</label></td>"
							+"<td><input type='text' name='portName' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='baudRate'>波特率:&nbsp;&nbsp;&nbsp;</label></td>"
							+"<td><input type='text' name='baudRate' style='width:200px' readonly='readonly'></input></td>"
						+"</tr>"
						+"</form>"
					);
					$("*[name='portID']").val(row.commandText.substring(1));
					var info = row.portConfigureInfo.split(";$");
					$("*[name='portName']").val(info[0]);
					$("*[name='baudRate']").val(info[1]=='null'?"":info[1]);
			}
			//$('#ff').form('load',row);	
		});
		
	</script>
</body>
</html>
