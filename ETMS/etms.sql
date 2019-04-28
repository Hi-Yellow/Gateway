/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.5.27 : Database - etms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_bd_can` */

DROP TABLE IF EXISTS `t_bd_can`;

CREATE TABLE `t_bd_can` (
  `TerminalCode` varchar(50) NOT NULL COMMENT '终端ID',
  `PortID` int(11) NOT NULL COMMENT 'CANID',
  `PortName` varchar(50) DEFAULT NULL COMMENT 'CAN端口名称',
  `BaudRate` int(11) DEFAULT NULL COMMENT '波特率',
  PRIMARY KEY (`TerminalCode`,`PortID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_can` */

insert  into `t_bd_can`(`TerminalCode`,`PortID`,`PortName`,`BaudRate`) values 
('00250100000200000013',1,'CAN1',115200),
('00250100000200000013',2,'CAN2',9600),
('00250100000200000014',1,NULL,NULL),
('00250100000200000016',1,NULL,NULL),
('00250100000200000016',2,NULL,NULL);

/*Table structure for table `t_bd_commandtype` */

DROP TABLE IF EXISTS `t_bd_commandtype`;

CREATE TABLE `t_bd_commandtype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CommandCode` varchar(20) NOT NULL COMMENT '命令码',
  `TypeName` varchar(40) DEFAULT NULL COMMENT '类型名称',
  `CommandText` varchar(200) DEFAULT NULL COMMENT ' 操作内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk COMMENT='命令类型表';

/*Data for the table `t_bd_commandtype` */

insert  into `t_bd_commandtype`(`ID`,`CommandCode`,`TypeName`,`CommandText`) values 
(1,'0900','参数配置','01 01 00 00'),
(2,'0A00','参数获取',NULL),
(3,'0B01','应用启用',NULL),
(4,'0B02','应用停用',NULL),
(5,'0B03','终端重启',NULL),
(6,'0B04','强制终端退出',NULL),
(7,'0B05','强制终端下线',NULL),
(8,'0B06','强制终端注册',NULL),
(9,'0B07','远程唤醒',NULL),
(10,'0B08','恢复出厂设置',NULL),
(11,'0B0B','终端升级',NULL),
(12,'0BFE','修改紧急呼叫号码',NULL);

/*Table structure for table `t_bd_netport` */

DROP TABLE IF EXISTS `t_bd_netport`;

CREATE TABLE `t_bd_netport` (
  `TerminalCode` varchar(50) NOT NULL COMMENT '终端ID',
  `PortID` int(11) NOT NULL COMMENT '网口ID',
  `PortName` varchar(50) DEFAULT NULL COMMENT '网口名称',
  `IPAddress` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `Gateway` varchar(50) DEFAULT NULL COMMENT '网关',
  `Netmask` varchar(50) DEFAULT NULL COMMENT '子网掩码',
  PRIMARY KEY (`PortID`,`TerminalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_netport` */

insert  into `t_bd_netport`(`TerminalCode`,`PortID`,`PortName`,`IPAddress`,`Gateway`,`Netmask`) values 
('00250100000200000013',1,'eth1','192.168.1.11','192.168.1.1','255.255.255.0'),
('00250100000200000014',1,NULL,NULL,NULL,NULL),
('00250100000200000016',1,NULL,NULL,NULL,NULL),
('00250100000200000013',2,'eht2','192.168.5.118','192.168.5.1','255.255.255.0'),
('00250100000200000016',2,NULL,NULL,NULL,NULL),
('00250100000200000013',3,'wlan0','','','255.255.255.0'),
('00250100000200000016',3,NULL,NULL,NULL,NULL),
('00250100000200000016',4,NULL,NULL,NULL,NULL);

/*Table structure for table `t_bd_operatetype` */

DROP TABLE IF EXISTS `t_bd_operatetype`;

CREATE TABLE `t_bd_operatetype` (
  `OperateType` int(11) DEFAULT NULL COMMENT '操作类型',
  `OperateName` varchar(20) DEFAULT NULL COMMENT '操作名称'
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='操作类型表';

/*Data for the table `t_bd_operatetype` */

insert  into `t_bd_operatetype`(`OperateType`,`OperateName`) values 
(1,'下达终端命令'),
(5,'添加终端信息'),
(6,'修改终端信息'),
(7,'删除终端信息');

/*Table structure for table `t_bd_portcountconfigure` */

DROP TABLE IF EXISTS `t_bd_portcountconfigure`;

CREATE TABLE `t_bd_portcountconfigure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalCode` varchar(20) DEFAULT NULL COMMENT '终端ID',
  `TerminalTypeID` int(11) DEFAULT NULL COMMENT '终端类型',
  `RS485Count` int(11) DEFAULT NULL COMMENT 'RS485串口数',
  `NetworkPortCount` int(11) DEFAULT NULL COMMENT '网口数',
  `WLANCount` int(11) DEFAULT NULL COMMENT 'WLAN数',
  `CANCount` int(11) DEFAULT NULL COMMENT 'CAN数',
  `RS232Count` int(11) DEFAULT NULL COMMENT 'RS232串口数',
  `TerminalConfigureID` int(11) DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TerminalCode` (`TerminalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_portcountconfigure` */

insert  into `t_bd_portcountconfigure`(`ID`,`TerminalCode`,`TerminalTypeID`,`RS485Count`,`NetworkPortCount`,`WLANCount`,`CANCount`,`RS232Count`,`TerminalConfigureID`) values 
(21,'00250100000200000013',1,2,3,3,2,2,1),
(36,'00250100000200000014',2,1,1,3,1,1,1),
(37,'00250100000200000016',1,1,4,NULL,2,3,1);

/*Table structure for table `t_bd_resulttype` */

DROP TABLE IF EXISTS `t_bd_resulttype`;

CREATE TABLE `t_bd_resulttype` (
  `ResultType` int(11) DEFAULT NULL COMMENT '结果类型',
  `ResultContent` varchar(200) DEFAULT NULL COMMENT '结果'
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='操作结果类型表';

/*Data for the table `t_bd_resulttype` */

insert  into `t_bd_resulttype`(`ResultType`,`ResultContent`) values 
(0,'操作成功'),
(1,'操作进行中'),
(2,'无效的操作码'),
(3,'无效的终端号'),
(4,'无效的命令内容'),
(5,'操作消息编码失败'),
(6,'发送消息至终端失败'),
(7,'执行超时'),
(8,'终端不存在'),
(9,'终端未登录'),
(10,'添加终端失败'),
(11,'修改终端失败'),
(12,'删除终端失败'),
(255,'操作失败'),
(254,'等待操作');

/*Table structure for table `t_bd_rs232` */

DROP TABLE IF EXISTS `t_bd_rs232`;

CREATE TABLE `t_bd_rs232` (
  `TerminalCode` varchar(50) NOT NULL COMMENT '终端ID',
  `PortID` int(11) NOT NULL COMMENT 'RS232ID',
  `PortName` varchar(50) DEFAULT NULL COMMENT 'RS232串口名称',
  `BaudRate` int(11) DEFAULT NULL COMMENT '波特率',
  `StopBit` int(11) DEFAULT NULL COMMENT '停止位',
  `CheckBit` varchar(50) DEFAULT NULL COMMENT '校验位',
  `DataBit` int(11) DEFAULT NULL COMMENT '数据位',
  PRIMARY KEY (`TerminalCode`,`PortID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_rs232` */

insert  into `t_bd_rs232`(`TerminalCode`,`PortID`,`PortName`,`BaudRate`,`StopBit`,`CheckBit`,`DataBit`) values 
('00250100000200000013',1,'/dev/ttyS2',115200,1,'n',8),
('00250100000200000013',2,'/dev/ttyS3',9600,1,'n',8),
('00250100000200000014',1,NULL,NULL,NULL,NULL,NULL),
('00250100000200000016',1,NULL,NULL,NULL,NULL,NULL),
('00250100000200000016',2,NULL,NULL,NULL,NULL,NULL),
('00250100000200000016',3,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_bd_rs485` */

DROP TABLE IF EXISTS `t_bd_rs485`;

CREATE TABLE `t_bd_rs485` (
  `TerminalCode` varchar(50) NOT NULL COMMENT '终端ID',
  `PortID` int(11) NOT NULL COMMENT 'RS485ID',
  `PortName` varchar(50) DEFAULT NULL COMMENT 'RS485串口名称',
  `BaudRate` int(11) DEFAULT NULL COMMENT '波特率',
  `StopBit` int(11) DEFAULT NULL COMMENT '停止位',
  `CheckBit` varchar(50) DEFAULT NULL COMMENT '校验位',
  `DataBit` int(11) DEFAULT NULL COMMENT '数据位',
  PRIMARY KEY (`PortID`,`TerminalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_rs485` */

insert  into `t_bd_rs485`(`TerminalCode`,`PortID`,`PortName`,`BaudRate`,`StopBit`,`CheckBit`,`DataBit`) values 
('00250100000200000013',1,'/dev/ttyS8',9600,1,'n',8),
('00250100000200000014',1,NULL,NULL,NULL,NULL,NULL),
('00250100000200000016',1,NULL,NULL,NULL,NULL,NULL),
('00250100000200000013',2,'/dev/ttyS9',115200,1,'n',8);

/*Table structure for table `t_bd_terminal` */

DROP TABLE IF EXISTS `t_bd_terminal`;

CREATE TABLE `t_bd_terminal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalCode` varchar(20) NOT NULL COMMENT '终端ID',
  `TerminalTypeID` int(11) DEFAULT NULL COMMENT '终端类型',
  `MDN` varchar(30) DEFAULT NULL COMMENT 'MDN号码',
  `LoginPsw` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `KPCRC` varchar(50) DEFAULT NULL COMMENT 'KPCRC校验码',
  `UIMPsw` varchar(50) DEFAULT NULL COMMENT 'Uim卡密码',
  `ESN` varchar(50) DEFAULT NULL COMMENT '电子序列号',
  `MEID` varchar(50) DEFAULT NULL COMMENT '移动设备标识',
  `IMSI` varchar(50) DEFAULT NULL,
  `UIMID` varchar(50) DEFAULT NULL COMMENT 'UIM卡ID',
  `BSID` varchar(50) DEFAULT NULL COMMENT '基站号',
  `TerminalStatusID` int(11) DEFAULT NULL COMMENT '终端状态 *',
  `TerminalProtocolID` int(11) DEFAULT NULL COMMENT '终端协议',
  `ManufacturingUnit` varchar(100) DEFAULT NULL COMMENT '生产厂商',
  `TerminalModel` varchar(50) DEFAULT NULL COMMENT '终端型号',
  `SoftwareVersion` varchar(50) DEFAULT NULL COMMENT '终端软件版本',
  `RestartCount` int(11) DEFAULT NULL COMMENT '终端重启次数 *',
  `LoginCount` int(11) DEFAULT NULL COMMENT '终端登录次数 *',
  `RegisterTime` varchar(20) DEFAULT NULL COMMENT '最近注册时间 *',
  `LoginTime` varchar(20) DEFAULT NULL COMMENT '最近登录时间 *',
  `RSSI` int(11) DEFAULT NULL COMMENT 'RSSI绝对值 *',
  `HardwareVersion` varchar(50) DEFAULT NULL COMMENT '终端硬件版本',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TerminalCode` (`TerminalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gbk COMMENT='电梯终端表';

/*Data for the table `t_bd_terminal` */

insert  into `t_bd_terminal`(`ID`,`TerminalCode`,`TerminalTypeID`,`MDN`,`LoginPsw`,`KPCRC`,`UIMPsw`,`ESN`,`MEID`,`IMSI`,`UIMID`,`BSID`,`TerminalStatusID`,`TerminalProtocolID`,`ManufacturingUnit`,`TerminalModel`,`SoftwareVersion`,`RestartCount`,`LoginCount`,`RegisterTime`,`LoginTime`,`RSSI`,`HardwareVersion`) values 
(13,'00250100000200000014',2,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'','',NULL,NULL,NULL,NULL,NULL,''),
(14,'00250100000200000013',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,NULL,'','',86,79,'181231161817','181231161818',NULL,''),
(15,'00250100000200000015',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'','',NULL,NULL,NULL,NULL,NULL,''),
(16,'00250100000200000016',1,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'','',NULL,NULL,NULL,NULL,NULL,'');

/*Table structure for table `t_bd_terminalconfigure` */

DROP TABLE IF EXISTS `t_bd_terminalconfigure`;

CREATE TABLE `t_bd_terminalconfigure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ConfigureAlias` varchar(40) DEFAULT NULL COMMENT '配置别名',
  `ParameterSet` varchar(200) DEFAULT NULL COMMENT '核心参数集合',
  `ParameterLength` int(11) DEFAULT NULL COMMENT '核心参数长度',
  `ApplicationCode` varchar(50) DEFAULT NULL COMMENT '行业代码',
  `HeartBeat` int(11) DEFAULT NULL COMMENT '连接心跳时长',
  `DataTimeOut` int(11) DEFAULT NULL COMMENT '消息超时时长',
  `DataSendCount` int(11) DEFAULT NULL COMMENT '消息重发次数',
  `MessageTimeOut` int(11) DEFAULT NULL COMMENT '短消息超时时长',
  `MessageSendCount` int(11) DEFAULT NULL COMMENT '短消息重发次数',
  `SleepTime` int(11) DEFAULT NULL COMMENT '休眠时长',
  `PPPNumber` varchar(30) DEFAULT NULL COMMENT 'PPP拨号号码',
  `PPPUser` varchar(30) DEFAULT NULL COMMENT 'PPP用户名',
  `PPPPsw` varchar(30) DEFAULT NULL COMMENT 'PPP密码',
  `MDMSAddress` varchar(50) DEFAULT NULL COMMENT 'MDMS地址',
  `MDMSTCP` int(11) DEFAULT NULL COMMENT 'MDMS_TCP端口',
  `MDMSUDP` int(11) DEFAULT NULL COMMENT 'MDMS_UDP端口',
  `DNSAddress` varchar(50) DEFAULT NULL COMMENT 'DNS服务器地址',
  `M2MNumber` varchar(30) DEFAULT NULL COMMENT 'M2M接入号',
  `ApplicationAddress` varchar(50) DEFAULT NULL COMMENT '应用服务器地址',
  `ApplicationPort` int(11) DEFAULT NULL COMMENT '应用服务器端口',
  `ApplicationNumber` varchar(30) DEFAULT NULL COMMENT '行业应用的短信特服号码',
  `UIMPsw` varchar(50) DEFAULT NULL COMMENT 'UIM卡密码',
  `PortSpeed` int(11) DEFAULT NULL COMMENT '串口速率',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ConfigureAlias` (`ConfigureAlias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk COMMENT='电梯终端配置表';

/*Data for the table `t_bd_terminalconfigure` */

insert  into `t_bd_terminalconfigure`(`ID`,`ConfigureAlias`,`ParameterSet`,`ParameterLength`,`ApplicationCode`,`HeartBeat`,`DataTimeOut`,`DataSendCount`,`MessageTimeOut`,`MessageSendCount`,`SleepTime`,`PPPNumber`,`PPPUser`,`PPPPsw`,`MDMSAddress`,`MDMSTCP`,`MDMSUDP`,`DNSAddress`,`M2MNumber`,`ApplicationAddress`,`ApplicationPort`,`ApplicationNumber`,`UIMPsw`,`PortSpeed`) values 
(1,'配置1','',0,NULL,20,NULL,NULL,NULL,NULL,200,'#777','card','card','101.132.186.145',18586,18585,'0.0.0.0',NULL,'221.226.188.114',6001,NULL,NULL,NULL),
(2,'配置2','',2,'',NULL,NULL,NULL,NULL,NULL,NULL,'dfsa','sdafd','sfdag','',1653415,NULL,'','','',NULL,'',NULL,NULL);

/*Table structure for table `t_bd_terminallogininfo` */

DROP TABLE IF EXISTS `t_bd_terminallogininfo`;

CREATE TABLE `t_bd_terminallogininfo` (
  `ID` int(11) NOT NULL,
  `TerminalCode` varchar(20) DEFAULT NULL COMMENT '终端ID',
  `TerminalTypeID` varchar(11) DEFAULT NULL COMMENT '终端类型',
  `LoginTime` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `LogoutTime` timestamp NULL DEFAULT NULL COMMENT '注销时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TerminalCode` (`TerminalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_terminallogininfo` */

insert  into `t_bd_terminallogininfo`(`ID`,`TerminalCode`,`TerminalTypeID`,`LoginTime`,`LogoutTime`) values 
(0,'00250100000200000013','1','2018-12-31 16:18:18','2018-12-31 16:22:35');

/*Table structure for table `t_bd_terminalmodel` */

DROP TABLE IF EXISTS `t_bd_terminalmodel`;

CREATE TABLE `t_bd_terminalmodel` (
  `ModelID` int(11) DEFAULT NULL COMMENT '终端型号',
  `ModelName` varchar(20) DEFAULT NULL COMMENT '型号名称'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_terminalmodel` */

insert  into `t_bd_terminalmodel`(`ModelID`,`ModelName`) values 
(1,'EdgeGate801'),
(2,'EdgeGate802');

/*Table structure for table `t_bd_terminalprotocol` */

DROP TABLE IF EXISTS `t_bd_terminalprotocol`;

CREATE TABLE `t_bd_terminalprotocol` (
  `ProtocolID` int(11) DEFAULT NULL,
  `ProtocolName` varchar(30) DEFAULT NULL COMMENT '协议名称'
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='终端协议表';

/*Data for the table `t_bd_terminalprotocol` */

insert  into `t_bd_terminalprotocol`(`ProtocolID`,`ProtocolName`) values 
(1,'1X'),
(2,'EVDO Rev.A');

/*Table structure for table `t_bd_terminalstatus` */

DROP TABLE IF EXISTS `t_bd_terminalstatus`;

CREATE TABLE `t_bd_terminalstatus` (
  `StatusID` int(11) DEFAULT NULL COMMENT '状态编号',
  `StatusName` varchar(40) DEFAULT NULL COMMENT '状态名称'
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='终端状态表';

/*Data for the table `t_bd_terminalstatus` */

insert  into `t_bd_terminalstatus`(`StatusID`,`StatusName`) values 
(0,'终端未注册'),
(1,'增强型终端等待密码下发'),
(2,'终端注册成功'),
(3,'终端登录成功');

/*Table structure for table `t_bd_terminaltype` */

DROP TABLE IF EXISTS `t_bd_terminaltype`;

CREATE TABLE `t_bd_terminaltype` (
  `TypeID` int(11) DEFAULT NULL COMMENT '终端类型',
  `TypeName` varchar(20) DEFAULT NULL COMMENT '类型名称'
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='终端类型表';

/*Data for the table `t_bd_terminaltype` */

insert  into `t_bd_terminaltype`(`TypeID`,`TypeName`) values 
(1,'普通型终端'),
(2,'增强型终端');

/*Table structure for table `t_bd_tlv` */

DROP TABLE IF EXISTS `t_bd_tlv`;

CREATE TABLE `t_bd_tlv` (
  `TerminalCode` varchar(20) NOT NULL COMMENT '终端ID',
  `TerminalTypeID` int(11) DEFAULT NULL COMMENT '终端类型',
  `UpgradeID` int(11) DEFAULT NULL COMMENT '版本ID',
  `UpgradeVersion` varchar(40) DEFAULT NULL COMMENT '版本号',
  `URI` varchar(100) DEFAULT NULL COMMENT '服务器URL',
  `DownloadUsername` varchar(20) DEFAULT NULL COMMENT '下载用户名',
  `DownloadPassword` varchar(20) DEFAULT NULL COMMENT '下载用户密码',
  `UpgradeType` int(11) DEFAULT NULL COMMENT '升级结果',
  PRIMARY KEY (`TerminalCode`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_tlv` */

insert  into `t_bd_tlv`(`TerminalCode`,`TerminalTypeID`,`UpgradeID`,`UpgradeVersion`,`URI`,`DownloadUsername`,`DownloadPassword`,`UpgradeType`) values 
('00250100000200000013',1,1,'ioBee.exe_V2','192.168.114.115','root','5000',0),
('00250100000200000014',2,NULL,NULL,NULL,NULL,NULL,NULL),
('00250100000200000016',1,1,'ioBee.exe_V2','192.168.114.114','root','5000',NULL);

/*Table structure for table `t_bd_upgradetype` */

DROP TABLE IF EXISTS `t_bd_upgradetype`;

CREATE TABLE `t_bd_upgradetype` (
  `UpgradeTypeID` int(11) DEFAULT NULL COMMENT '升级类型',
  `UpgradeContent` varchar(50) DEFAULT NULL COMMENT '升级结果'
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `t_bd_upgradetype` */

insert  into `t_bd_upgradetype`(`UpgradeTypeID`,`UpgradeContent`) values 
(0,'成功'),
(136,'URI连接不上'),
(137,'目标版本获取不到'),
(138,'文件下载失败'),
(139,'升级操作失败');

/*Table structure for table `t_bs_terminalcommand` */

DROP TABLE IF EXISTS `t_bs_terminalcommand`;

CREATE TABLE `t_bs_terminalcommand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TerminalCode` varchar(20) DEFAULT NULL COMMENT '终端ID',
  `CommandCode` varchar(20) DEFAULT NULL COMMENT '命令码',
  `CommandText` varchar(500) DEFAULT NULL COMMENT '命令内容',
  `portconfigureInfo` varchar(200) DEFAULT NULL COMMENT '端口配置信息',
  `ExecuteTime` datetime DEFAULT NULL COMMENT '执行时间',
  `Result` varchar(200) DEFAULT NULL COMMENT '执行结果',
  `Executer` varchar(30) DEFAULT NULL COMMENT '操作人',
  `OperateType` int(11) DEFAULT NULL COMMENT '操作类型',
  `ResultType` int(11) DEFAULT NULL COMMENT '结果类型',
  PRIMARY KEY (`ID`),
  KEY `CommandCode` (`CommandCode`),
  KEY `TerminalID` (`TerminalCode`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=gbk COMMENT='电梯执行命令表';

/*Data for the table `t_bs_terminalcommand` */

insert  into `t_bs_terminalcommand`(`ID`,`TerminalCode`,`CommandCode`,`CommandText`,`portconfigureInfo`,`ExecuteTime`,`Result`,`Executer`,`OperateType`,`ResultType`) values 
(148,'00250100000200000013','0900','A2',NULL,'2018-09-25 22:50:05',NULL,'13951085759',1,1),
(149,'00250100000200000013','0900','B2',NULL,'2018-09-25 22:50:14',NULL,'13951085759',1,1),
(150,'00250100000200000013','0900','C2',NULL,'2018-09-25 22:50:22',NULL,'13951085759',1,1),
(151,'00250100000200000013','0900','D2',NULL,'2018-09-25 22:50:29',NULL,'13951085759',1,7),
(152,'00250100000200000013','0900','A2',NULL,'2018-09-25 22:53:04','140100020001','13951085759',1,0),
(153,'00250100000200000013','0900','B2',NULL,'2018-09-25 22:53:27','140100020001','13951085759',1,0),
(154,'00250100000200000013','0900','C2',NULL,'2018-09-25 22:53:41','140100020001','13951085759',1,0),
(155,'00250100000200000013','0900','D2',NULL,'2018-09-25 22:53:55','140100020001','13951085759',1,0),
(156,'00250100000200000013','0900','D1',NULL,'2018-09-25 22:54:07','140100020001','13951085759',1,0),
(157,'00250100000200000014','0900','A1','FSD;$200;$1;$231;$1','2018-09-27 14:32:09',NULL,'17805106382',1,7),
(158,'00250100000200000014','0900','A1','AA;$360;$1;$N;$1','2018-09-27 14:33:10',NULL,'17805106382',1,7),
(159,'00250100000200000014','0900','B1','FSF;$265;$1;$2;$2','2018-09-27 14:33:30',NULL,'17805106382',1,7),
(160,'00250100000200000014','0900','C1','FSD;$127.0.0.1;$42;$1','2018-09-27 14:33:48',NULL,'17805106382',1,7),
(161,'00250100000200000014','0900','D1','SFD;$5425','2018-09-27 14:33:56',NULL,'17805106382',1,7),
(162,'00250100000200000014','0900','A1','GFDAS;$165;$1;$25;$2','2018-09-27 14:35:25',NULL,'17805106382',1,7),
(163,'00250100000200000013','0B04','',NULL,'2018-09-27 21:57:30',NULL,'13951085759',1,7),
(164,'00250100000200000013','0B05','',NULL,'2018-09-27 21:59:31',NULL,'13951085759',1,7),
(165,'00250100000200000013','0B04','',NULL,'2018-09-27 22:11:15',NULL,'13951085759',1,7),
(166,'00250100000200000013','0B04','',NULL,'2018-09-27 22:18:38',NULL,'13951085759',1,0),
(167,'00250100000200000013','0B0B','00 41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 14 66 74 70 3A 31 39  32 2E 31 36 38 2E 31 2E    \r\n32 30 30 3A 32 31 41 04  00 04 74 65 73 74 41 05    \r\n00 04 74 65 73 74',NULL,'2018-10-03 23:35:51',NULL,'13951085759',1,2),
(168,'00250100000200000013','0B0B','00 41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 14 66 74 70 3A 31 39  32 2E 31 36 38 2E 31 2E    \r\n32 30 30 3A 32 31 41 04  00 04 74 65 73 74 41 05    \r\n00 04 74 65 73 74',NULL,'2018-10-03 23:36:53',NULL,'13951085759',1,2),
(169,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 14 66 74 70 3A 31 39  32 2E 31 36 38 2E 31 2E    \r\n32 30 30 3A 32 31 41 04  00 04 74 65 73 74 41 05    \r\n00 04 74 65 73 74',NULL,'2018-10-03 23:40:39',NULL,'13951085759',1,0),
(170,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 14 66 74 70 3A 31 39  32 2E 31 36 38 2E 31 2E    \r\n32 30 30 3A 32 31 41 04  00 04 74 65 73 74 41 05    \r\n00 04 74 65 73 74',NULL,'2018-10-03 23:47:54',NULL,'13951085759',1,0),
(171,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-03 23:50:06',NULL,'13951085759',1,0),
(172,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-03 23:53:11',NULL,'13951085759',1,0),
(173,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-04 00:04:53',NULL,'13951085759',1,7),
(174,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-04 00:30:41',NULL,'13951085759',1,7),
(175,'00250100000200000013','0B0B','00 2A 01 00 00 07 00 01  00 25 01 00 00 02 00 00\r\n00 13 00 00 00 04 02 80  03 01 40 02 00 00 0B 04\r\n30 01 00 00 00 03 00 02  1E A2',NULL,'2018-10-04 00:33:06',NULL,'13951085759',1,2),
(176,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-04 00:33:26',NULL,'13951085759',1,0),
(177,'00250100000200000013','0B0B','41 01 00 01  02 41 02 00 01 32 41 03    \r\n00 16 66 74 70 3A 2F 2F  31 39 32 2E 31 36 38 2E    \r\n31 2E 32 30 30 3A 32 31  41 04 00 04 74 65 73 74    \r\n41 05 00 04 74 65 73 74',NULL,'2018-10-04 00:47:10',NULL,'13951085759',1,0),
(178,'00250100000200000013','0B0B','41 01 00 01  01 41 02 00 01 32 41 03    \r\n00 10 31 39 32 2E 31 36  38 2E 31 2E 32 30 30 3A    \r\n32 31 41 04 00 04 74 65  73 74 41 05 00 04 74 65    \r\n73 74',NULL,'2018-10-04 08:51:28',NULL,'13951085759',1,0),
(179,'00250100000200000013','0B0B','41 01 00 01  01 41 02 00 01 32 41 03    \r\n00 10 31 39 32 2E 31 36  38 2E 31 2E 32 30 30 3A    \r\n32 31 41 04 00 04 74 65  73 74 41 05 00 04 74 65    \r\n73 74',NULL,'2018-10-04 08:56:52',NULL,'13951085759',1,0),
(180,'00250100000200000013','0B03','',NULL,'2018-10-14 11:15:30',NULL,'13951085759',1,0),
(181,'00250100000200000013','0900','E1','eth0;$;$;$','2018-10-14 20:19:00',NULL,'17805106382',1,7),
(182,'00250100000200000013','0900','E2','eth1;$;$;$','2018-10-14 20:19:15',NULL,'17805106382',1,7),
(183,'00250100000200000013','0900','E3','WLAN0;$;$;$','2018-10-14 20:19:28',NULL,'17805106382',1,7),
(184,'00250100000200000014','0900','E1','eth0;$;$;$','2018-10-14 20:19:38',NULL,'17805106382',1,7),
(185,'00250100000200000014','0900','E2','eth1;$;$;$','2018-10-14 20:19:47',NULL,'17805106382',1,7),
(186,'00250100000200000014','0900','E3','WLAN0;$;$;$','2018-10-14 20:19:59',NULL,'17805106382',1,7),
(187,'00250100000200000013','0900','E1','eth0;$;$;$','2018-10-14 20:38:48',NULL,'17805106382',1,7),
(188,'00250100000200000013','0900','E2','eth1;$;$;$','2018-10-14 20:38:59',NULL,'17805106382',1,7),
(189,'00250100000200000013','0900','E3','WLAN0;$;$;$','2018-10-14 20:39:12',NULL,'17805106382',1,7),
(190,'00250100000200000014','0900','E1','eth0;$;$;$','2018-10-14 20:39:30',NULL,'17805106382',1,7),
(191,'00250100000200000014','0900','E2','eth1;$;$;$','2018-10-14 20:39:40',NULL,'17805106382',1,7),
(192,'00250100000200000014','0900','E3','WLAN0;$;$;$','2018-10-14 20:39:50',NULL,'17805106382',1,7),
(193,'00250100000200000013','0B0B',NULL,'1;$2;$192.168.114.115;$ppp;$ppppp','2018-10-15 17:49:00',NULL,'17805106382',1,7),
(194,'00250100000200000013','0B0B',NULL,'1;$2;$;$ppp;$ppppp','2018-10-15 18:03:11',NULL,'17805106382',1,7),
(195,'00250100000200000013','0B0B',NULL,'1;$2;$null;$root;$5000','2018-10-15 18:30:03',NULL,'17805106382',1,7),
(196,'00250100000200000013','0B0B',NULL,'1;$2;$null;$root;$5000','2018-10-15 18:37:23',NULL,'17805106382',1,7),
(197,'00250100000200000013','0B0B',NULL,'1;$2;$null;$root;$5000','2018-10-15 18:43:25',NULL,'17805106382',1,7),
(198,'00250100000200000014','0B0B',NULL,'1;$2;$null;$root;$5000','2018-10-15 18:54:03',NULL,'17805106382',1,7),
(199,'00250100000200000013','0B0B',NULL,'1;$2;$192.168.114.115;$root;$5000','2018-10-15 19:18:58',NULL,'17805106382',1,7),
(200,'00250100000200000013','0B0B',NULL,'1;$2;$192.168.114.115;$root;$5000','2018-10-15 21:27:33',NULL,'17805106382',1,7),
(201,'00250100000200000013','0900','C3','wlan0;$;$;$255.255.255.0','2018-10-16 20:03:52',NULL,'17805106382',1,7),
(202,'00250100000200000013','0900','C3','wlan0;$;$;$255.255.255.0','2018-10-16 20:03:52',NULL,'17805106382',1,7),
(203,'00250100000200000013','0B0B',NULL,'1;$ioBee.exe_V2;$192.168.114.115;$root;$5000','2018-10-16 20:06:17',NULL,'17805106382',1,7),
(204,'00250100000200000013','0900','C3','wlan0;$192.168.1.233;$192.168.1.1;$255.255.255.0','2018-10-16 20:10:00',NULL,'17805106382',1,7),
(205,'00250100000200000013','0900','C3','wlan0;$192.168.1.233;$192.168.1.1;$255.255.255.0','2018-10-16 20:17:18',NULL,'17805106382',1,7),
(206,'00250100000200000013','0900','C1','eth0;$192.168.1.22;$192.168.1.1;$255.255.255.0','2018-10-16 20:18:26',NULL,'17805106382',1,7),
(207,'00250100000200000013','0900','C2','eht1;$192.168.3.1;$192.168.3.1;$255.255.255.0','2018-10-16 20:18:55',NULL,'17805106382',1,7),
(208,'00250100000200000013','0900','A1','/dev/ttyS8;$9600;$1;$n;$8','2019-04-13 15:26:09',NULL,'17805106382',1,7),
(209,'00250100000200000013','0900','A1','/dev/ttyS8;$9600;$1;$n;$8','2019-04-13 15:26:11',NULL,'17805106382',1,7),
(210,'00250100000200000016','0B0B',NULL,'1;$ioBee.exe_V2;$192.168.114.114;$root;$5000','2019-04-20 17:20:02',NULL,'17805106382',1,7),
(211,'00250100000200000016','0B0B',NULL,'1;$ioBee.exe_V2;$192.168.114.114;$root;$5000','2019-04-21 12:14:23',NULL,'17805106382',1,7),
(212,'00250100000200000013','0900','A1','/dev/ttyS8;$9600;$1;$n;$8','2019-04-21 12:16:30',NULL,'17805106382',1,7),
(213,'00250100000200000015','0900','01 01 00 00',NULL,'2019-04-21 21:48:04',NULL,'17805106382',1,7),
(214,'00250100000200000015','0B0B',NULL,'1;$ioBee.exe_V2;$192.168.114.115;$root;$5000','2019-04-23 13:11:08',NULL,'17805106382',1,7);

/*Table structure for table `t_sa_function` */

DROP TABLE IF EXISTS `t_sa_function`;

CREATE TABLE `t_sa_function` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
  `FunctionNumber` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能编号',
  `FunctionName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能名称',
  `ModuleName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块名称',
  `ActionName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作名称',
  `FunctionIcon` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `FunctionUrl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '对应地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk COMMENT='功能表';

/*Data for the table `t_sa_function` */

insert  into `t_sa_function`(`ID`,`FunctionNumber`,`FunctionName`,`ModuleName`,`ActionName`,`FunctionIcon`,`FunctionUrl`) values 
(1,'001','系统管理',NULL,NULL,'icon-admin',NULL),
(2,'001001','用户管理','UserAction','doList','icon-users',NULL),
(3,'002','基础资料','','','icon-basedata',NULL),
(4,'002001','终端资料','TerminalAction','doList','icon-terminal',NULL),
(5,'002002','终端配置管理','TerminalConfigureAction','doList','icon-configure',NULL),
(6,'003','终端管理',NULL,NULL,'icon-mointor',NULL),
(7,'003001','执行终端命令','TerminalCommandAction','doList','icon-execute',NULL),
(8,'003002','历史命令查看','TerminalCommandAction','doListhistory','icon-browserecord',NULL),
(9,'003003','终端状态查询','TerminalAction','doListStatus','icon-terminal',NULL),
(10,'002003','终端命令管理','CommandTypeAction','doList','icon-disposefault',NULL),
(11,'001002','登录日志','LoginAction','doList','icon-normalrecord',NULL);

/*Table structure for table `t_sa_logininfo` */

DROP TABLE IF EXISTS `t_sa_logininfo`;

CREATE TABLE `t_sa_logininfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '登录ID',
  `UserName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `LoginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `LogoutTime` timestamp NULL DEFAULT NULL COMMENT '注销时间',
  `RealName` varchar(30) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`ID`),
  KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=gbk COMMENT='用户登录信息表';

/*Data for the table `t_sa_logininfo` */

insert  into `t_sa_logininfo`(`ID`,`UserName`,`LoginTime`,`LogoutTime`,`RealName`) values 
(599,'admin','2018-09-21 16:07:47',NULL,'超级管理员'),
(600,'17805106382','2018-09-21 16:08:46','2018-09-21 16:09:30','黄爽'),
(601,'admin','2018-09-21 16:09:34',NULL,'超级管理员'),
(602,'18305168135','2018-09-21 16:09:51',NULL,'边俊源'),
(603,'17805106382','2018-09-21 16:40:15','2018-09-21 16:41:28','黄爽'),
(604,'18305168135','2018-09-21 16:41:32','2018-09-21 16:43:16','边俊源'),
(605,'admin','2018-09-21 16:43:20','2018-09-21 16:43:41','超级管理员'),
(606,'17805106382','2018-09-21 16:43:47',NULL,'黄爽'),
(607,'17805106382','2018-09-21 17:16:54','2018-09-21 17:17:09','黄爽'),
(608,'admin','2018-09-21 17:17:14',NULL,'超级管理员'),
(609,'17805106382','2018-09-21 18:23:56',NULL,'黄爽'),
(610,'17805106382','2018-09-21 18:55:34',NULL,'黄爽'),
(611,'17805106382','2018-09-21 19:13:06',NULL,'黄爽'),
(612,'17805106382','2018-09-21 21:12:51','2018-09-21 21:13:10','黄爽'),
(613,'admin','2018-09-21 21:13:15','2018-09-21 21:13:33','超级管理员'),
(614,'17805106382','2018-09-21 21:13:38','2018-09-21 21:15:18','黄爽'),
(615,'admin','2018-09-21 21:15:23','2018-09-21 21:16:31','超级管理员'),
(616,'17805106382','2018-09-21 21:17:21','2018-09-21 21:19:37','黄爽'),
(617,'admin','2018-09-21 21:19:45','2018-09-21 21:20:13','超级管理员'),
(618,'17805106382','2018-09-21 21:20:18',NULL,'黄爽'),
(619,'17805106382','2018-09-22 10:05:54',NULL,'黄爽'),
(620,'17805106382','2018-09-22 10:05:56',NULL,'黄爽'),
(621,'17805106382','2018-09-22 11:29:47',NULL,'黄爽'),
(622,'17805106382','2018-09-22 15:55:18',NULL,'黄爽'),
(623,'17805106382','2018-09-22 18:23:55',NULL,'黄爽'),
(624,'17805106382','2018-09-22 18:27:22',NULL,'黄爽'),
(625,'17805106382','2018-09-22 19:11:49',NULL,'黄爽'),
(626,'17805106382','2018-09-22 19:13:26',NULL,'黄爽'),
(627,'17805106382','2018-09-22 21:25:53','2018-09-22 21:32:50','黄爽'),
(628,'18305168135','2018-09-22 21:32:54','2018-09-22 21:33:06','边俊源'),
(629,'admin','2018-09-22 21:33:10','2018-09-22 21:54:12','超级管理员'),
(630,'17805106382','2018-09-22 21:54:17',NULL,'黄爽'),
(631,'18305168135','2018-09-22 22:29:01',NULL,'边俊源'),
(632,'admin','2018-09-23 10:07:05','2018-09-23 10:07:51','超级管理员'),
(633,'17805106382','2018-09-23 10:07:55',NULL,'黄爽'),
(634,'17805106382','2018-09-23 10:14:34',NULL,'黄爽'),
(635,'17805106382','2018-09-23 14:47:52',NULL,'黄爽'),
(636,'17805106382','2018-09-23 16:30:35',NULL,'黄爽'),
(637,'17805106382','2018-09-23 16:56:27',NULL,'黄爽'),
(638,'17805106382','2018-09-23 17:08:12',NULL,'黄爽'),
(639,'17805106382','2018-09-23 17:17:18',NULL,'黄爽'),
(640,'17805106382','2018-09-23 17:25:58',NULL,'黄爽'),
(641,'17805106382','2018-09-23 17:26:10',NULL,'黄爽'),
(642,'admin','2018-09-23 17:26:38','2018-09-23 17:27:02','超级管理员'),
(643,'admin','2018-09-23 17:27:04',NULL,'超级管理员'),
(644,'17805106382','2018-09-23 17:48:32',NULL,'黄爽'),
(645,'18305168135','2018-09-23 17:49:53',NULL,'边俊源'),
(646,'17805106382','2018-09-23 18:00:25',NULL,'黄爽'),
(647,'17805106382','2018-09-23 18:06:13',NULL,'黄爽'),
(648,'17805106382','2018-09-23 18:39:14',NULL,'黄爽'),
(649,'17805106382','2018-09-23 20:15:49',NULL,'黄爽'),
(650,'17805106382','2018-09-24 21:16:28',NULL,'黄爽'),
(651,'18305168135','2018-09-25 09:16:25','2018-09-25 09:18:32','边俊源'),
(652,'admin','2018-09-25 09:18:36','2018-09-25 09:19:32','超级管理员'),
(653,'17805106382','2018-09-25 20:17:04',NULL,'黄爽'),
(654,'13951085759','2018-09-25 22:48:59',NULL,'曾生根'),
(655,'17805106382','2018-09-26 08:36:17',NULL,'黄爽'),
(656,'17805106382','2018-09-26 09:15:38',NULL,'黄爽'),
(657,'17805106382','2018-09-26 15:59:24',NULL,'黄爽'),
(658,'17805106382','2018-09-26 16:05:04',NULL,'黄爽'),
(659,'17805106382','2018-09-26 20:37:01',NULL,'黄爽'),
(660,'17805106382','2018-09-26 20:47:48',NULL,'黄爽'),
(661,'17805106382','2018-09-26 20:50:43',NULL,'黄爽'),
(662,'17805106382','2018-09-27 12:47:01',NULL,'黄爽'),
(663,'17805106382','2018-09-27 14:29:28',NULL,'黄爽'),
(664,'17805106382','2018-09-27 14:32:35','2018-09-27 14:37:43','黄爽'),
(665,'admin','2018-09-27 14:37:47','2018-09-27 14:42:09','超级管理员'),
(666,'18305168135','2018-09-27 14:42:15','2018-09-27 14:42:22','边俊源'),
(667,'admin','2018-09-27 14:42:27','2018-09-27 14:42:48','超级管理员'),
(668,'17805106382','2018-09-27 14:42:51','2018-09-27 14:42:56','黄爽'),
(669,'18305168135','2018-09-27 14:43:00',NULL,'边俊源'),
(670,'17805106382','2018-09-27 14:48:54',NULL,'黄爽'),
(671,'13951085759','2018-09-27 21:40:17',NULL,'曾生根'),
(672,'13951085759','2018-10-03 23:29:40',NULL,'曾生根'),
(673,'13951085759','2018-10-04 08:33:24',NULL,'曾生根'),
(674,'13951085759','2018-10-14 10:06:06',NULL,'曾生根'),
(675,'13951085759','2018-10-14 11:02:52',NULL,'曾生根'),
(676,'17805106382','2018-10-14 16:56:00',NULL,'黄爽'),
(677,'17805106382','2018-10-14 19:01:35',NULL,'黄爽'),
(678,'17805106382','2018-10-14 19:06:03',NULL,'黄爽'),
(679,'17805106382','2018-10-14 19:45:31',NULL,'黄爽'),
(680,'17805106382','2018-10-14 19:49:49',NULL,'黄爽'),
(681,'17805106382','2018-10-14 20:27:31',NULL,'黄爽'),
(682,'17805106382','2018-10-14 21:59:51',NULL,'黄爽'),
(683,'17805106382','2018-10-15 08:08:45',NULL,'黄爽'),
(684,'17805106382','2018-10-15 08:58:04',NULL,'黄爽'),
(685,'17805106382','2018-10-15 09:21:23',NULL,'黄爽'),
(686,'17805106382','2018-10-15 15:29:11',NULL,'黄爽'),
(687,'17805106382','2018-10-15 16:46:18',NULL,'黄爽'),
(688,'17805106382','2018-10-15 16:53:13',NULL,'黄爽'),
(689,'17805106382','2018-10-15 17:14:19',NULL,'黄爽'),
(690,'17805106382','2018-10-15 17:17:50',NULL,'黄爽'),
(691,'17805106382','2018-10-15 17:22:19',NULL,'黄爽'),
(692,'17805106382','2018-10-15 17:26:29',NULL,'黄爽'),
(693,'17805106382','2018-10-15 17:48:39',NULL,'黄爽'),
(694,'17805106382','2018-10-15 18:28:07','2018-10-15 18:28:45','黄爽'),
(695,'17805106382','2018-10-15 18:28:46',NULL,'黄爽'),
(696,'17805106382','2018-10-15 19:18:35',NULL,'黄爽'),
(697,'17805106382','2018-10-15 21:18:04',NULL,'黄爽'),
(698,'17805106382','2018-10-15 21:27:08',NULL,'黄爽'),
(699,'17805106382','2018-10-16 18:40:28',NULL,'黄爽'),
(700,'17805106382','2018-10-16 19:48:04',NULL,'黄爽'),
(701,'17805106382','2018-10-16 19:55:10',NULL,'黄爽'),
(702,'17805106382','2018-10-18 09:14:06',NULL,'黄爽'),
(703,'17805106382','2018-10-18 09:29:09',NULL,'黄爽'),
(704,'17805106382','2018-10-18 22:01:02',NULL,'黄爽'),
(705,'17805106382','2018-10-19 11:44:32',NULL,'黄爽'),
(706,'17805106382','2018-10-19 16:12:26',NULL,'黄爽'),
(707,'17805106382','2018-10-19 19:29:57',NULL,'黄爽'),
(708,'17805106382','2018-10-19 22:44:31',NULL,'黄爽'),
(709,'17805106382','2018-10-23 21:54:27',NULL,'黄爽'),
(710,'17805106382','2018-10-23 21:56:40',NULL,'黄爽'),
(711,'17805106382','2018-10-25 11:31:21',NULL,'黄爽'),
(712,'17805106382','2018-10-25 11:40:02',NULL,'黄爽'),
(713,'17805106382','2018-10-25 14:34:29','2018-10-25 15:16:29','黄爽'),
(714,'17805106382','2018-10-25 16:39:00',NULL,'黄爽'),
(715,'17805106382','2018-10-25 16:39:41','2018-10-25 16:57:49','黄爽'),
(716,'17805106382','2018-10-25 16:57:50',NULL,'黄爽'),
(717,'17805106382','2018-10-25 18:58:16',NULL,'黄爽'),
(718,'17805106382','2018-10-25 19:07:12',NULL,'黄爽'),
(719,'17805106382','2018-10-25 22:36:29',NULL,'黄爽'),
(720,'17805106382','2018-10-26 12:07:22',NULL,'黄爽'),
(721,'17805106382','2018-10-26 12:30:15',NULL,'黄爽'),
(722,'17805106382','2018-10-26 14:10:14',NULL,'黄爽'),
(723,'17805106382','2018-10-27 17:10:29',NULL,'黄爽'),
(724,'17805106382','2018-10-29 16:52:33',NULL,'黄爽'),
(725,'admin','2018-10-29 16:52:46',NULL,'超级管理员'),
(726,'17805106382','2018-10-30 22:33:43','2018-10-30 22:35:24','黄爽'),
(727,'admin','2018-10-30 22:35:31',NULL,'超级管理员'),
(728,'17805106382','2018-11-02 08:24:28','2018-11-02 08:36:33','黄爽'),
(729,'17805106382','2018-11-10 19:16:25',NULL,'黄爽'),
(730,'17805106382','2018-11-10 20:28:48',NULL,'黄爽'),
(731,'admin','2018-11-10 20:45:09',NULL,'超级管理员'),
(732,'17805106382','2018-11-14 20:03:38',NULL,'黄爽'),
(733,'13951085759','2018-12-31 16:03:34',NULL,'曾生根'),
(734,'13951085759','2018-12-31 16:06:30',NULL,'曾生根'),
(735,'admin','2019-01-19 11:23:14','2019-01-19 11:23:50','超级管理员'),
(736,'17805106382','2019-01-19 11:24:16',NULL,'黄爽'),
(737,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(738,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(739,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(740,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(741,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(742,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(743,'17805106382','2019-04-13 15:25:12',NULL,'黄爽'),
(744,'17805106382','2019-04-13 15:25:16',NULL,'黄爽'),
(745,'17805106382','2019-04-13 15:25:16',NULL,'黄爽'),
(746,'17805106382','2019-04-14 15:04:45',NULL,'黄爽'),
(747,'17805106382','2019-04-20 13:40:44',NULL,'黄爽'),
(748,'17805106382','2019-04-20 17:19:44',NULL,'黄爽'),
(749,'17805106382','2019-04-20 18:56:28',NULL,'黄爽'),
(750,'17805106382','2019-04-21 12:14:10',NULL,'黄爽'),
(751,'17805106382','2019-04-21 13:17:09',NULL,'黄爽'),
(752,'17805106382','2019-04-21 20:10:03',NULL,'黄爽'),
(753,'17805106382','2019-04-21 21:47:35',NULL,'黄爽'),
(754,'17805106382','2019-04-22 13:31:56',NULL,'黄爽'),
(755,'17805106382','2019-04-22 21:17:49',NULL,'黄爽'),
(756,'17805106382','2019-04-23 12:57:02',NULL,'黄爽'),
(757,'17805106382','2019-04-23 14:33:30',NULL,'黄爽'),
(758,'17805106382','2019-04-23 18:20:22',NULL,'黄爽'),
(759,'17805106382','2019-04-23 21:39:07',NULL,'黄爽'),
(760,'17805106382','2019-04-24 09:35:27',NULL,'黄爽'),
(761,'17805106382','2019-04-26 10:21:46',NULL,'黄爽'),
(762,'17805106382','2019-04-26 14:49:11',NULL,'黄爽'),
(763,'17805106382','2019-04-26 16:04:55',NULL,'黄爽');

/*Table structure for table `t_sa_role` */

DROP TABLE IF EXISTS `t_sa_role`;

CREATE TABLE `t_sa_role` (
  `ID` int(11) NOT NULL COMMENT '角色ID',
  `RoleName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `RoleDiscription` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='角色表';

/*Data for the table `t_sa_role` */

insert  into `t_sa_role`(`ID`,`RoleName`,`RoleDiscription`) values 
(1,'超级管理员',NULL),
(2,'系统管理员',NULL),
(3,'普通用户',NULL);

/*Table structure for table `t_sa_rolefunction` */

DROP TABLE IF EXISTS `t_sa_rolefunction`;

CREATE TABLE `t_sa_rolefunction` (
  `RoleID` int(11) DEFAULT NULL COMMENT '角色ID',
  `FunctionID` int(11) DEFAULT NULL COMMENT '功能ID',
  KEY `FK_T_SA_RoleFunction_RoleID` (`RoleID`),
  KEY `FK_T_SA_Roleion_FunctionID` (`FunctionID`),
  CONSTRAINT `FK_T_SA_RoleFunction_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `t_sa_role` (`ID`),
  CONSTRAINT `FK_T_SA_Roleion_FunctionID` FOREIGN KEY (`FunctionID`) REFERENCES `t_sa_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='角色模块表';

/*Data for the table `t_sa_rolefunction` */

insert  into `t_sa_rolefunction`(`RoleID`,`FunctionID`) values 
(1,2),
(1,4),
(1,5),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11);

/*Table structure for table `t_sa_user` */

DROP TABLE IF EXISTS `t_sa_user`;

CREATE TABLE `t_sa_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `UserName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `UserPsw` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码 MD5加密',
  `RealName` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `RoleID` int(11) DEFAULT NULL COMMENT '角色编号',
  `Flag` int(11) DEFAULT NULL COMMENT '标记 1：启用；0：停用',
  `Memo` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `FK_T_SA_User_RoleID` (`RoleID`),
  CONSTRAINT `FK_T_SA_User_RoleID` FOREIGN KEY (`RoleID`) REFERENCES `t_sa_role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=gbk COMMENT='用户表';

/*Data for the table `t_sa_user` */

insert  into `t_sa_user`(`ID`,`UserName`,`UserPsw`,`RealName`,`RoleID`,`Flag`,`Memo`) values 
(2,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员',1,1,''),
(26,'18001580300',NULL,'黄波',3,1,''),
(27,'18305168135','e10adc3949ba59abbe56e057f20f883e','边俊源',3,1,''),
(32,'13951085759','e10adc3949ba59abbe56e057f20f883e','曾生根',2,1,''),
(34,'17805106382','e10adc3949ba59abbe56e057f20f883e','黄爽',2,1,'');

/*Table structure for table `v_bd_portcountconfigure` */

DROP TABLE IF EXISTS `v_bd_portcountconfigure`;

/*!50001 DROP VIEW IF EXISTS `v_bd_portcountconfigure` */;
/*!50001 DROP TABLE IF EXISTS `v_bd_portcountconfigure` */;

/*!50001 CREATE TABLE  `v_bd_portcountconfigure`(
 `ID` int(11) ,
 `TerminalCode` varchar(20) ,
 `TerminalTypeID` int(11) ,
 `TypeName` varchar(20) ,
 `TerminalConfigureID` int(11) ,
 `ConfigureAlias` varchar(40) ,
 `RS485Count` int(11) ,
 `RS232Count` int(11) ,
 `NetworkPortCount` int(11) ,
 `CANCount` int(11) 
)*/;

/*Table structure for table `v_bd_terminal` */

DROP TABLE IF EXISTS `v_bd_terminal`;

/*!50001 DROP VIEW IF EXISTS `v_bd_terminal` */;
/*!50001 DROP TABLE IF EXISTS `v_bd_terminal` */;

/*!50001 CREATE TABLE  `v_bd_terminal`(
 `ID` int(11) ,
 `TerminalCode` varchar(20) ,
 `TerminalTypeID` int(11) ,
 `MDN` varchar(30) ,
 `LoginPsw` varchar(50) ,
 `KPCRC` varchar(50) ,
 `UIMPsw` varchar(50) ,
 `ESN` varchar(50) ,
 `MEID` varchar(50) ,
 `IMSI` varchar(50) ,
 `UIMID` varchar(50) ,
 `BSID` varchar(50) ,
 `TerminalStatusID` int(11) ,
 `TerminalProtocolID` int(11) ,
 `ManufacturingUnit` varchar(100) ,
 `TerminalModel` varchar(50) ,
 `SoftwareVersion` varchar(50) ,
 `RestartCount` int(11) ,
 `LoginCount` int(11) ,
 `RegisterTime` varchar(20) ,
 `LoginTime` varchar(20) ,
 `RSSI` int(11) ,
 `TypeName` varchar(20) ,
 `StatusName` varchar(40) ,
 `ProtocolName` varchar(30) 
)*/;

/*Table structure for table `v_bd_terminallogininfo` */

DROP TABLE IF EXISTS `v_bd_terminallogininfo`;

/*!50001 DROP VIEW IF EXISTS `v_bd_terminallogininfo` */;
/*!50001 DROP TABLE IF EXISTS `v_bd_terminallogininfo` */;

/*!50001 CREATE TABLE  `v_bd_terminallogininfo`(
 `ID` int(11) ,
 `TerminalCode` varchar(20) ,
 `TerminalTypeID` varchar(11) ,
 `LoginTime` timestamp ,
 `LogoutTime` timestamp ,
 `TypeName` varchar(20) 
)*/;

/*Table structure for table `v_bd_tlv` */

DROP TABLE IF EXISTS `v_bd_tlv`;

/*!50001 DROP VIEW IF EXISTS `v_bd_tlv` */;
/*!50001 DROP TABLE IF EXISTS `v_bd_tlv` */;

/*!50001 CREATE TABLE  `v_bd_tlv`(
 `UpgradeID` int(11) ,
 `TerminalCode` varchar(20) ,
 `TerminalTypeID` int(11) ,
 `TypeName` varchar(20) ,
 `UpgradeVersion` varchar(40) ,
 `URI` varchar(100) ,
 `DownloadUsername` varchar(20) ,
 `DownloadPassword` varchar(20) ,
 `UpgradeType` int(11) ,
 `UpgradeContent` varchar(50) 
)*/;

/*Table structure for table `v_bs_terminalcommand` */

DROP TABLE IF EXISTS `v_bs_terminalcommand`;

/*!50001 DROP VIEW IF EXISTS `v_bs_terminalcommand` */;
/*!50001 DROP TABLE IF EXISTS `v_bs_terminalcommand` */;

/*!50001 CREATE TABLE  `v_bs_terminalcommand`(
 `ID` int(11) ,
 `OperateType` int(11) ,
 `TerminalCode` varchar(20) ,
 `CommandCode` varchar(20) ,
 `CommandText` varchar(500) ,
 `PortConfigureInfo` varchar(200) ,
 `ExecuteTime` datetime ,
 `Result` varchar(200) ,
 `Executer` varchar(30) ,
 `TypeName` varchar(40) ,
 `ResultType` int(11) ,
 `OperateName` varchar(20) ,
 `ResultContent` varchar(200) 
)*/;

/*Table structure for table `v_sa_rolefunction` */

DROP TABLE IF EXISTS `v_sa_rolefunction`;

/*!50001 DROP VIEW IF EXISTS `v_sa_rolefunction` */;
/*!50001 DROP TABLE IF EXISTS `v_sa_rolefunction` */;

/*!50001 CREATE TABLE  `v_sa_rolefunction`(
 `RoleID` int(11) ,
 `FunctionNumber` varchar(30) 
)*/;

/*Table structure for table `v_sa_rolefunctions` */

DROP TABLE IF EXISTS `v_sa_rolefunctions`;

/*!50001 DROP VIEW IF EXISTS `v_sa_rolefunctions` */;
/*!50001 DROP TABLE IF EXISTS `v_sa_rolefunctions` */;

/*!50001 CREATE TABLE  `v_sa_rolefunctions`(
 `RoleID` int(11) ,
 `FunctionNumber` varchar(30) ,
 `FunctionName` varchar(30) ,
 `ModuleName` varchar(30) ,
 `ActionName` varchar(30) ,
 `FunctionIcon` varchar(30) ,
 `FunctionUrl` varchar(50) 
)*/;

/*Table structure for table `v_sa_user` */

DROP TABLE IF EXISTS `v_sa_user`;

/*!50001 DROP VIEW IF EXISTS `v_sa_user` */;
/*!50001 DROP TABLE IF EXISTS `v_sa_user` */;

/*!50001 CREATE TABLE  `v_sa_user`(
 `ID` int(11) ,
 `UserName` varchar(30) ,
 `UserPsw` varchar(50) ,
 `RealName` varchar(30) ,
 `RoleID` int(11) ,
 `Flag` int(11) ,
 `Memo` varchar(100) ,
 `RoleName` varchar(20) ,
 `RoleDiscription` varchar(100) ,
 `FlagName` varchar(2) 
)*/;

/*Table structure for table `v_sa_userfunction` */

DROP TABLE IF EXISTS `v_sa_userfunction`;

/*!50001 DROP VIEW IF EXISTS `v_sa_userfunction` */;
/*!50001 DROP TABLE IF EXISTS `v_sa_userfunction` */;

/*!50001 CREATE TABLE  `v_sa_userfunction`(
 `UserName` varchar(30) ,
 `FunctionNumber` varchar(30) ,
 `FunctionName` varchar(30) ,
 `ModuleName` varchar(30) ,
 `ActionName` varchar(30) ,
 `FunctionIcon` varchar(30) ,
 `FunctionUrl` varchar(50) 
)*/;

/*View structure for view v_bd_portcountconfigure */

/*!50001 DROP TABLE IF EXISTS `v_bd_portcountconfigure` */;
/*!50001 DROP VIEW IF EXISTS `v_bd_portcountconfigure` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bd_portcountconfigure` AS (select `t_bd_portcountconfigure`.`ID` AS `ID`,`t_bd_portcountconfigure`.`TerminalCode` AS `TerminalCode`,`t_bd_portcountconfigure`.`TerminalTypeID` AS `TerminalTypeID`,`t_bd_terminaltype`.`TypeName` AS `TypeName`,`t_bd_portcountconfigure`.`TerminalConfigureID` AS `TerminalConfigureID`,`t_bd_terminalconfigure`.`ConfigureAlias` AS `ConfigureAlias`,`t_bd_portcountconfigure`.`RS485Count` AS `RS485Count`,`t_bd_portcountconfigure`.`RS232Count` AS `RS232Count`,`t_bd_portcountconfigure`.`NetworkPortCount` AS `NetworkPortCount`,`t_bd_portcountconfigure`.`CANCount` AS `CANCount` from ((`t_bd_portcountconfigure` left join `t_bd_terminaltype` on((`t_bd_terminaltype`.`TypeID` = `t_bd_portcountconfigure`.`TerminalTypeID`))) left join `t_bd_terminalconfigure` on((`t_bd_terminalconfigure`.`ID` = `t_bd_portcountconfigure`.`TerminalConfigureID`)))) */;

/*View structure for view v_bd_terminal */

/*!50001 DROP TABLE IF EXISTS `v_bd_terminal` */;
/*!50001 DROP VIEW IF EXISTS `v_bd_terminal` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bd_terminal` AS select `t_bd_terminal`.`ID` AS `ID`,`t_bd_terminal`.`TerminalCode` AS `TerminalCode`,`t_bd_terminal`.`TerminalTypeID` AS `TerminalTypeID`,`t_bd_terminal`.`MDN` AS `MDN`,`t_bd_terminal`.`LoginPsw` AS `LoginPsw`,`t_bd_terminal`.`KPCRC` AS `KPCRC`,`t_bd_terminal`.`UIMPsw` AS `UIMPsw`,`t_bd_terminal`.`ESN` AS `ESN`,`t_bd_terminal`.`MEID` AS `MEID`,`t_bd_terminal`.`IMSI` AS `IMSI`,`t_bd_terminal`.`UIMID` AS `UIMID`,`t_bd_terminal`.`BSID` AS `BSID`,`t_bd_terminal`.`TerminalStatusID` AS `TerminalStatusID`,`t_bd_terminal`.`TerminalProtocolID` AS `TerminalProtocolID`,`t_bd_terminal`.`ManufacturingUnit` AS `ManufacturingUnit`,`t_bd_terminal`.`TerminalModel` AS `TerminalModel`,`t_bd_terminal`.`SoftwareVersion` AS `SoftwareVersion`,`t_bd_terminal`.`RestartCount` AS `RestartCount`,`t_bd_terminal`.`LoginCount` AS `LoginCount`,`t_bd_terminal`.`RegisterTime` AS `RegisterTime`,`t_bd_terminal`.`LoginTime` AS `LoginTime`,`t_bd_terminal`.`RSSI` AS `RSSI`,`t_bd_terminaltype`.`TypeName` AS `TypeName`,`t_bd_terminalstatus`.`StatusName` AS `StatusName`,`t_bd_terminalprotocol`.`ProtocolName` AS `ProtocolName` from (((`t_bd_terminal` join `t_bd_terminalprotocol` on((`t_bd_terminal`.`TerminalProtocolID` = `t_bd_terminalprotocol`.`ProtocolID`))) left join `t_bd_terminalstatus` on((`t_bd_terminal`.`TerminalStatusID` = `t_bd_terminalstatus`.`StatusID`))) join `t_bd_terminaltype` on((`t_bd_terminal`.`TerminalTypeID` = `t_bd_terminaltype`.`TypeID`))) */;

/*View structure for view v_bd_terminallogininfo */

/*!50001 DROP TABLE IF EXISTS `v_bd_terminallogininfo` */;
/*!50001 DROP VIEW IF EXISTS `v_bd_terminallogininfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bd_terminallogininfo` AS (select `t_bd_terminallogininfo`.`ID` AS `ID`,`t_bd_terminallogininfo`.`TerminalCode` AS `TerminalCode`,`t_bd_terminallogininfo`.`TerminalTypeID` AS `TerminalTypeID`,`t_bd_terminallogininfo`.`LoginTime` AS `LoginTime`,`t_bd_terminallogininfo`.`LogoutTime` AS `LogoutTime`,`t_bd_terminaltype`.`TypeName` AS `TypeName` from (`t_bd_terminallogininfo` left join `t_bd_terminaltype` on((`t_bd_terminallogininfo`.`TerminalTypeID` = `t_bd_terminaltype`.`TypeID`)))) */;

/*View structure for view v_bd_tlv */

/*!50001 DROP TABLE IF EXISTS `v_bd_tlv` */;
/*!50001 DROP VIEW IF EXISTS `v_bd_tlv` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bd_tlv` AS (select `t_bd_tlv`.`UpgradeID` AS `UpgradeID`,`t_bd_tlv`.`TerminalCode` AS `TerminalCode`,`t_bd_tlv`.`TerminalTypeID` AS `TerminalTypeID`,`t_bd_terminaltype`.`TypeName` AS `TypeName`,`t_bd_tlv`.`UpgradeVersion` AS `UpgradeVersion`,`t_bd_tlv`.`URI` AS `URI`,`t_bd_tlv`.`DownloadUsername` AS `DownloadUsername`,`t_bd_tlv`.`DownloadPassword` AS `DownloadPassword`,`t_bd_tlv`.`UpgradeType` AS `UpgradeType`,`t_bd_upgradetype`.`UpgradeContent` AS `UpgradeContent` from ((`t_bd_tlv` left join `t_bd_terminaltype` on((`t_bd_terminaltype`.`TypeID` = `t_bd_tlv`.`TerminalTypeID`))) left join `t_bd_upgradetype` on((`t_bd_upgradetype`.`UpgradeTypeID` = `t_bd_tlv`.`UpgradeType`)))) */;

/*View structure for view v_bs_terminalcommand */

/*!50001 DROP TABLE IF EXISTS `v_bs_terminalcommand` */;
/*!50001 DROP VIEW IF EXISTS `v_bs_terminalcommand` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bs_terminalcommand` AS (select `t_bs_terminalcommand`.`ID` AS `ID`,`t_bs_terminalcommand`.`OperateType` AS `OperateType`,`t_bs_terminalcommand`.`TerminalCode` AS `TerminalCode`,`t_bs_terminalcommand`.`CommandCode` AS `CommandCode`,`t_bs_terminalcommand`.`CommandText` AS `CommandText`,`t_bs_terminalcommand`.`portconfigureInfo` AS `PortConfigureInfo`,`t_bs_terminalcommand`.`ExecuteTime` AS `ExecuteTime`,`t_bs_terminalcommand`.`Result` AS `Result`,`t_bs_terminalcommand`.`Executer` AS `Executer`,`t_bd_commandtype`.`TypeName` AS `TypeName`,`t_bs_terminalcommand`.`ResultType` AS `ResultType`,`t_bd_operatetype`.`OperateName` AS `OperateName`,`t_bd_resulttype`.`ResultContent` AS `ResultContent` from (((`t_bs_terminalcommand` left join `t_bd_commandtype` on((`t_bs_terminalcommand`.`CommandCode` = `t_bd_commandtype`.`CommandCode`))) left join `t_bd_operatetype` on((`t_bs_terminalcommand`.`OperateType` = `t_bd_operatetype`.`OperateType`))) left join `t_bd_resulttype` on((`t_bs_terminalcommand`.`ResultType` = `t_bd_resulttype`.`ResultType`)))) */;

/*View structure for view v_sa_rolefunction */

/*!50001 DROP TABLE IF EXISTS `v_sa_rolefunction` */;
/*!50001 DROP VIEW IF EXISTS `v_sa_rolefunction` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sa_rolefunction` AS select distinct `t_sa_rolefunction`.`RoleID` AS `RoleID`,`t_sa_function`.`FunctionNumber` AS `FunctionNumber` from (`t_sa_rolefunction` join `t_sa_function` on((`t_sa_rolefunction`.`FunctionID` = `t_sa_function`.`ID`))) */;

/*View structure for view v_sa_rolefunctions */

/*!50001 DROP TABLE IF EXISTS `v_sa_rolefunctions` */;
/*!50001 DROP VIEW IF EXISTS `v_sa_rolefunctions` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sa_rolefunctions` AS select distinct `v_sa_rolefunction`.`RoleID` AS `RoleID`,`t_sa_function`.`FunctionNumber` AS `FunctionNumber`,`t_sa_function`.`FunctionName` AS `FunctionName`,`t_sa_function`.`ModuleName` AS `ModuleName`,`t_sa_function`.`ActionName` AS `ActionName`,`t_sa_function`.`FunctionIcon` AS `FunctionIcon`,`t_sa_function`.`FunctionUrl` AS `FunctionUrl` from (`v_sa_rolefunction` join `t_sa_function` on((`v_sa_rolefunction`.`FunctionNumber` like '%'))) */;

/*View structure for view v_sa_user */

/*!50001 DROP TABLE IF EXISTS `v_sa_user` */;
/*!50001 DROP VIEW IF EXISTS `v_sa_user` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sa_user` AS select `t_sa_user`.`ID` AS `ID`,`t_sa_user`.`UserName` AS `UserName`,`t_sa_user`.`UserPsw` AS `UserPsw`,`t_sa_user`.`RealName` AS `RealName`,`t_sa_user`.`RoleID` AS `RoleID`,`t_sa_user`.`Flag` AS `Flag`,`t_sa_user`.`Memo` AS `Memo`,`t_sa_role`.`RoleName` AS `RoleName`,`t_sa_role`.`RoleDiscription` AS `RoleDiscription`,if(isnull(`t_sa_user`.`Flag`),'',if((`t_sa_user`.`Flag` = 1),'启用',if((`t_sa_user`.`Flag` = 2),'停用',''))) AS `FlagName` from (`t_sa_user` join `t_sa_role` on((`t_sa_user`.`RoleID` = `t_sa_role`.`ID`))) */;

/*View structure for view v_sa_userfunction */

/*!50001 DROP TABLE IF EXISTS `v_sa_userfunction` */;
/*!50001 DROP VIEW IF EXISTS `v_sa_userfunction` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sa_userfunction` AS select `t_sa_user`.`UserName` AS `UserName`,`v_sa_rolefunctions`.`FunctionNumber` AS `FunctionNumber`,`v_sa_rolefunctions`.`FunctionName` AS `FunctionName`,`v_sa_rolefunctions`.`ModuleName` AS `ModuleName`,`v_sa_rolefunctions`.`ActionName` AS `ActionName`,`v_sa_rolefunctions`.`FunctionIcon` AS `FunctionIcon`,`v_sa_rolefunctions`.`FunctionUrl` AS `FunctionUrl` from (`t_sa_user` join `v_sa_rolefunctions` on((`t_sa_user`.`RoleID` = `v_sa_rolefunctions`.`RoleID`))) order by `v_sa_rolefunctions`.`FunctionNumber` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
