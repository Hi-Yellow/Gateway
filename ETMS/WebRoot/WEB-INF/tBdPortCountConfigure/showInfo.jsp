<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<%@ include file="/common/common.jspf"%>
	<title>端口详情</title>
	<base href="${basePath }"/>
	<link rel="stylesheet" href="css/mycss.css" type="text/css"></link>
    
</head>
<body class="mybody" id="mybody">
<div style="scroll:auto" id="mydiv">
</div>
	<script type="text/javascript">
		$(function() {
			var row = parent.$('#dg').datagrid("getSelected");
			row.tBdPortCountConfigurePrivilegeStart = format(row.tBdPortCountConfigurePrivilegeStart);
			var max=Math.max(row.rs485Count,row.rs232Count,row.cancount,row.networkPortCount);
			var td = "<td>";
			var tr = "<tr>";
			var tdf = "</td>";
			var trf = "</tr>";
			var table = "<table>";
			var tablef = "</table>";
			var form = " class='myfm' ";
			var float = " style='float:left' ";
			var body = "";
			var rs485Title = "";
			var rs232Title = "";
			var canTitle = "";
			var networkTitle = "";
			var rs485Title2 = "";
			var rs232Title2 = "";
			var canTitle2 = "";
			var networkTitle2 = "";
			if(max<2){
				td="";
				tr="";
				trf="";
				tdf="";
				tablef="";
				table="";
				float="";
				body="mybody";
				rs485Title2 = "<h4 style='clear:both;'>RS485串口</h4><hr>";
				rs232Title2 = "<h4 style='clear:both;'b>RS232串口</h4><hr>";
				canTitle2 = "<h4 style='clear:both;'>CAN</h4><hr>";
				networkTitle2 = "<h4 style='clear:both;'>网口</h4><hr>";
			}else{
				form="";
				body="mydiv";
				rs485Title = tr+td+"<h4 style='clear:both;'>RS485串口</h4><hr>"+tdf+trf;
				rs232Title = tr+td+"<h4 style='clear:both;'b>RS232串口</h4><hr>"+tdf+trf;
				canTitle = tr+td+"<h4 style='clear:both;'>CAN</h4><hr>"+tdf+trf;
				networkTitle = tr+td+"<h4 style='clear:both;'>网口</h4><hr>"+tdf+trf;
				max = max*180;
				$('#'+body).width(max);
			}
			$('#'+body).append(table);
			var i =1;
			
			if(row.rs485Count>0){
				$('#'+body).append(rs485Title);
				$('#'+body).append(tr);
				for(i=1;i<=row.rs485Count;i++){
					$('#'+body).append(
						td+"<form id='rs485ff"+i+"' "+form+float+">"
						+rs485Title2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>串口号:</label></td>"
							+"<td><input name='portID' style='width:110px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>串口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='baudRate'>波特率:&nbsp;</label></td>"
							+"<td><input type='text' name='baudRate' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='stopBit'>停止位:</label></td> "
							+"<td><input type='text' name='stopBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='checkBit'>校验位:</label></td> "
							+"<td><input type='text' name='checkBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='dataBit'>数据位:</label></td> "
						+"<td><input type='text' name='dataBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"+tdf
					);
				}
				$('#'+body).append(trf);
				$.ajax({
					url:'tBdRS485/selectByCode.action?terminalCode='+row.terminalCode,
					dataType:'json',
					success: function(data){
						for(i=1;i<=row.rs485Count;i++){
							$('#rs485ff'+i).form('load',data[i-1]);
						}
					},
					error: function(){}
					});
			}
			if(row.rs232Count>0){
				$('#'+body).append(rs232Title);
				$('#'+body).append(tr);
				for(i=1;i<=row.rs232Count;i++){
					$('#'+body).append(
						td+"<form id='rs232ff"+i+"' "+form+float+">"
						+rs232Title2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>串口号:</label></td>"
							+"<td><input name='portID' style='width:110px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>串口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='baudRate'>波特率:&nbsp;</label></td>"
							+"<td><input type='text' name='baudRate' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='stopBit'>停止位:</label></td> "
							+"<td><input type='text' name='stopBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='checkBit'>校验位:</label></td> "
							+"<td><input type='text' name='checkBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"
							+"<td><label for='dataBit'>数据位:</label></td> "
						+"<td><input type='text' name='dataBit' style='width:110px'  readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"+tdf
					);
				}
				$('#'+body).append(trf);
				$.ajax({
					url:'tBdRS232/selectByCode.action?terminalCode='+row.terminalCode,
					dataType:'json',
					success: function(data){
						for(i=1;i<=row.rs232Count;i++){
							$('#rs232ff'+i).form('load',data[i-1]);
						}
					},
					error: function(){}
					});
			}
			if(row.networkPortCount>0){
				$('#'+body).append(networkTitle);
				$('#'+body).append(tr);
				for(i=1;i<=row.networkPortCount;i++){
					$('#'+body).append(
						td+"<form id='networkPortff"+i+"' "+form+float+">"
						+networkTitle2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>网口号:</label></td>"
							+"<td><input name='portID' style='width:110px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='portName'>网口名:</label></td>" 
							+"<td><input type='text' name='portName' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"           
							+"<td><label for='ipAddress'>IP地址:</label></td>" 
							+"<td><input type='text' name='ipAddress' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"         
							+"<td><label for='gateway'>网关:</label></td>"
							+"<td><input type='text' name='gateway' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"        
							+"<td><label for='netmask'>子网掩码:</label></td>"
							+"<td><input type='text' name='netmask' style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"</table>"
						+"</form>"+tdf
					);
				}
				$('#'+body).append(trf);
				$.ajax({
					url:'tBdNetPort/selectByCode.action?terminalCode='+row.terminalCode,
					dataType:'json',
					success: function(data){
						for(i=1;i<=row.networkPortCount;i++){
							$('#networkPortff'+i).form('load',data[i-1]);
						}
					},
					error: function(){}
					});
			}
			if(row.cancount>0){
				$('#'+body).append(canTitle);
				$('#'+body).append(tr);
				for(i=1;i<=row.cancount;i++){
					$('#'+body).append(
						td+"<form id='canff"+i+"' "+form+float+">"
						+canTitle2
	   					+"<table>"
						+"<tr class='myfitem3'>"
							+"<td><label for='portID'>CAN号:</label></td>"
							+"<td><input name='portID'  style='width:110px' readonly='readonly'/></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"       
							+"<td><label for='portName'>CAN名:</label></td>"
							+"<td><input type='text' name='portName'  style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"<tr class='myfitem3'>"       
							+"<td><label for='baudRate'>波特率:</label></td>"
							+"<td><input type='text' name='baudRate'  style='width:110px' readonly='readonly'></input></td>"
						+"</tr>"
						+"</form>"+tdf
					);
				}
				$('#'+body).append(trf);
				$.ajax({
					url:'tBdCAN/selectByCode.action?terminalCode='+row.terminalCode,
					dataType:'json',
					success: function(data){
						for(i=1;i<=row.cancount;i++){
							$('#canff'+i).form('load',data[i-1]);
						}
					},
					error: function(){}
					});
			}
			$('#'+body).append(tablef);
			//$('#ff').form('load',row);	
		});
		
	</script>
</body>
</html>
