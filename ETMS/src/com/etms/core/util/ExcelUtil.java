package com.etms.core.util;

import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletOutputStream;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import com.etms.portCountConfigure.pojo.TBdPortCountConfigure;
import com.etms.role.pojo.Role;
import com.etms.terminal.pojo.TBdTerminal;
import com.etms.terminalCommand.pojo.TBdTerminalCommand;
import com.etms.terminalConfigure.pojo.TBdTerminalConfigure;
import com.etms.user.pojo.User;
import com.etms.user.service.UserService;

public class ExcelUtil {

	/**
	 * 创建单元格样式
	 * @param workbook 工作簿
	 * @param fontSize 字体大小
	 * @return 单元格样式
	 */
	private static HSSFCellStyle createCellStyle(HSSFWorkbook workbook, short fontSize) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
		//创建字体
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);//加粗字体
		font.setFontHeightInPoints(fontSize);
		//加载字体
		style.setFont(font);
		return style;
	}
	
	
	/**
	 * 导出user列表到excel
	 * @param userList
	 * @param outputStream
	 */
	public static void exportUserExcel(List<User> userList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("用户列表");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"用户名","姓名","用户类型","是否启用","备注"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(userList != null){
				for(int j = 0; j < userList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(userList.get(j).getUserName());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(userList.get(j).getRealName());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(userList.get(j).getRole().getRoleName());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(userList.get(j).getFlag()==1?"启用":"停用");
					HSSFCell cell15 = row.createCell(4);
					cell15.setCellValue(userList.get(j).getMemo());
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

	public static void importUserExcel(MultipartFile userExcel, UserService userService) throws Exception {
		InputStream fileInputStream = userExcel.getInputStream();
		String userExcelFileName = userExcel.getOriginalFilename();
		boolean is03Excel = userExcelFileName.matches("^.+\\.(?i)(xls)$");
		//1、读取工作簿
		Workbook workbook = is03Excel ? new HSSFWorkbook(fileInputStream):new XSSFWorkbook(fileInputStream);
		//2、读取工作表
		Sheet sheet = workbook.getSheetAt(0);
		//3、读取行
		if(sheet.getPhysicalNumberOfRows() > 1){
			User user = null;
			for(int k = 1; k < sheet.getPhysicalNumberOfRows(); k++){
				//4、读取单元格
				Row row = sheet.getRow(k);
				user = new User();
				//用户名
				Cell cell0 = row.getCell(0);
				user.setUserName(cell0.getStringCellValue());
				//姓名
				Cell cell1 = row.getCell(1);
				user.setRealName(cell1.getStringCellValue());
				//用户类型
				row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
				user.setRole(new Role(row.getCell(2).getStringCellValue()));
				//是否启用
				Cell cell3 = row.getCell(3);					
				user.setFlag(Integer.valueOf(cell3.getStringCellValue()));						
				//备注
				Cell cell4 = row.getCell(4);
				if(null != cell4)
					user.setMemo(cell4.getStringCellValue());					
				
				//5、保存用户
				userService.insert(user);
			}
		}
		workbook.close();
		fileInputStream.close();
		
	}
	
	/**
	 * 导出终端基本信息到excel
	 * @param tBdTerminalList
	 * @param outputStream
	 */
	public static void exportTBdTerminalExcel(List<TBdTerminal> tBdTerminalList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("终端基本信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"终端ID","终端类型","电话号码","终端协议","生产厂商","终端型号","终端软件版本","终端硬件版本"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(tBdTerminalList != null){
				for(int j = 0; j < tBdTerminalList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(tBdTerminalList.get(j).getTerminalCode());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(tBdTerminalList.get(j).getTypeName());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(tBdTerminalList.get(j).getMdn());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(tBdTerminalList.get(j).getProtocolName());
					HSSFCell cell15 = row.createCell(4);
					cell15.setCellValue(tBdTerminalList.get(j).getManuFacturingUnit());
					HSSFCell cell16 = row.createCell(5);
					cell16.setCellValue(tBdTerminalList.get(j).getTerminalModel());
					HSSFCell cell17 = row.createCell(6);
					cell17.setCellValue(tBdTerminalList.get(j).getSoftwareVersion());
					HSSFCell cell18 = row.createCell(7);
					cell18.setCellValue(tBdTerminalList.get(j).getHardwareVersion());
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出终端状态列表到excel
	 * @param tBdTerminalList
	 * @param outputStream
	 */
	public static void exportTBdTerminalStatusExcel(List<TBdTerminal> TBdTerminalStatusList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("终端状态信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"终端ID","终端类型","终端登录次数","最近注册时间","最近登陆时间","终端状态 "};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(TBdTerminalStatusList != null){
				for(int j = 0; j < TBdTerminalStatusList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(TBdTerminalStatusList.get(j).getTerminalCode());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(TBdTerminalStatusList.get(j).getTypeName());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(TBdTerminalStatusList.get(j).getLoginCount());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(TBdTerminalStatusList.get(j).getRegisterTime());
					HSSFCell cell15 = row.createCell(4);
					cell15.setCellValue(TBdTerminalStatusList.get(j).getLoginTime());
					HSSFCell cell16 = row.createCell(5);
					cell16.setCellValue(TBdTerminalStatusList.get(j).getStatusName());
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出通信配置信息列表到excel
	 * @param tBdTerminalConfigureList
	 * @param outputStream
	 */
	public static void exportTBdCommunicationConfigureExcel(List<TBdTerminalConfigure> tBdTerminalConfigureList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("通信配置信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"配置别名","PPP拨号号码","PPP用户名","PPP密码","MDMS地址","MDMS_TCP端口","MDMS_UDP端口","DNS服务器地址","应用服务器地址","应用服务器端口"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(tBdTerminalConfigureList != null){
				for(int j = 0; j < tBdTerminalConfigureList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(tBdTerminalConfigureList.get(j).getConfigureAlias());
					HSSFCell cell21 = row.createCell(10);
					cell21.setCellValue(tBdTerminalConfigureList.get(j).getPppNumber());
					HSSFCell cell22 = row.createCell(11);
					cell22.setCellValue(tBdTerminalConfigureList.get(j).getPppUser());
					HSSFCell cell23 = row.createCell(12);
					cell23.setCellValue(tBdTerminalConfigureList.get(j).getPppPsw());
					HSSFCell cell24 = row.createCell(13);
					cell24.setCellValue(tBdTerminalConfigureList.get(j).getMdmsAddress());
					HSSFCell cell25 = row.createCell(14);
					cell25.setCellValue(tBdTerminalConfigureList.get(j).getMdmsTcp());
					HSSFCell cell26 = row.createCell(15);
					cell26.setCellValue(tBdTerminalConfigureList.get(j).getMdmsUdp());
					HSSFCell cell27 = row.createCell(16);
					cell27.setCellValue(tBdTerminalConfigureList.get(j).getDnsAddress());
					
					HSSFCell cell29 = row.createCell(18);
					cell29.setCellValue(tBdTerminalConfigureList.get(j).getApplicationAddress());
					HSSFCell cell30 = row.createCell(19);
					cell30.setCellValue(tBdTerminalConfigureList.get(j).getApplicationPort());
					
					
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 导出业务配置信息列表到excel
	 * @param tBdTerminalConfigureList
	 * @param outputStream
	 */
	public static void exportTBdBusinessConfigureExcel(List<TBdTerminalConfigure> tBdTerminalConfigureList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("业务配置信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"配置别名","应用服务器地址","应用服务器端口"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(tBdTerminalConfigureList != null){
				for(int j = 0; j < tBdTerminalConfigureList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(tBdTerminalConfigureList.get(j).getConfigureAlias());				
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(tBdTerminalConfigureList.get(j).getApplicationAddress());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(tBdTerminalConfigureList.get(j).getApplicationPort());
					
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void exportTBdTerminalCommandExcel(List<TBdTerminalCommand> TBdTerminalCommandList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("终端执行命令历史信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"终端ID","操作命令","操作内容","执行时间","执行返回","执行人","执行结果"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(TBdTerminalCommandList != null){
				for(int j = 0; j < TBdTerminalCommandList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(TBdTerminalCommandList.get(j).getTerminalCode());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(TBdTerminalCommandList.get(j).getTypeName());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(TBdTerminalCommandList.get(j).getCommandText());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(TBdTerminalCommandList.get(j).getExecuteTime());
					HSSFCell cell15 = row.createCell(4);
					cell15.setCellValue(TBdTerminalCommandList.get(j).getResult());
					HSSFCell cell16 = row.createCell(5);
					cell16.setCellValue(TBdTerminalCommandList.get(j).getExecuter());
					HSSFCell cell17 = row.createCell(6);
					cell17.setCellValue(TBdTerminalCommandList.get(j).getResultContent());
		
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static void exportTBdPortCountConfigureExcel(List<TBdPortCountConfigure> TBdPortCountConfigureList, ServletOutputStream outputStream) {
		try {
			//1、创建工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1、创建合并单元格对象
			//CellRangeAddress cellRangeAddress = new CellRangeAddress(0, 0, 0, 4);//起始行号，结束行号，起始列号，结束列号
			
			//1.2、头标题样式
			//HSSFCellStyle style1 = createCellStyle(workbook, (short)16);
			
			//1.3、列标题样式
			HSSFCellStyle style2 = createCellStyle(workbook, (short)13);
			
			//2、创建工作表
			HSSFSheet sheet = workbook.createSheet("端口配置信息");
			//2.1、加载合并单元格对象
			//sheet.addMergedRegion(cellRangeAddress);
			//设置默认列宽
			sheet.setDefaultColumnWidth(15);
			
			//3、创建行
			//3.1、创建头标题行；并且设置头标题
			//HSSFRow row1 = sheet.createRow(0);
			//HSSFCell cell1 = row1.createCell(0);
			//加载单元格样式
			//cell1.setCellStyle(style1);
			//cell1.setCellValue("用户列表");
			
			//3.2、创建列标题行；并且设置列标题
			HSSFRow row2 = sheet.createRow(0);
			String[] titles = {"终端ID","串口数","网口数","CAN数","波特率","停止位","校验位","数据位","IP地址","网关","子网掩码","结果类型","操作类型","波特率","执行时间","执行人"};
			for(int i = 0; i < titles.length; i++){
				HSSFCell cell2 = row2.createCell(i);
				//加载单元格样式
				cell2.setCellStyle(style2);
				cell2.setCellValue(titles[i]);
			}
			
			/*SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");*/
			//4、操作单元格；将用户列表写入excel
			if(TBdPortCountConfigureList != null){
				for(int j = 0; j < TBdPortCountConfigureList.size(); j++){
					HSSFRow row = sheet.createRow(j+1);
					HSSFCell cell11 = row.createCell(0);
					cell11.setCellValue(TBdPortCountConfigureList.get(j).getTerminalCode());
					HSSFCell cell12 = row.createCell(1);
					cell12.setCellValue(TBdPortCountConfigureList.get(j).getRs485Count());
					HSSFCell cell13 = row.createCell(2);
					cell13.setCellValue(TBdPortCountConfigureList.get(j).getNetworkPortCount());
					HSSFCell cell14 = row.createCell(3);
					cell14.setCellValue(TBdPortCountConfigureList.get(j).getCancount());
					HSSFCell cell15 = row.createCell(4);
					cell12.setCellValue(TBdPortCountConfigureList.get(j).getRs232Count());
					
				}
			}
			//5、输出
			workbook.write(outputStream);
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

