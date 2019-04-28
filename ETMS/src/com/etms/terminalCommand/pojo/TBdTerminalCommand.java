package com.etms.terminalCommand.pojo;

import java.sql.Timestamp;

public class TBdTerminalCommand {
    private Integer id;

    private Integer operateType;

    private String terminalCode;

    private String commandCode;

    private String commandText;
    
    private String portConfigureInfo;

    private Timestamp executeTime;

    private String result;

    private String executer;

    private String typeName;

    private Integer resultType;

    private String operateName;

    private String resultContent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOperateType() {
        return operateType;
    }

    public void setOperateType(Integer operateType) {
        this.operateType = operateType;
    }

    public String getTerminalCode() {
        return terminalCode;
    }

    public void setTerminalCode(String terminalCode) {
        this.terminalCode = terminalCode == null ? null : terminalCode.trim();
    }

    public String getCommandCode() {
        return commandCode;
    }

    public void setCommandCode(String commandCode) {
        this.commandCode = commandCode == null ? null : commandCode.trim();
    }

    public String getCommandText() {
        return commandText;
    }

    public void setCommandText(String commandText) {
        this.commandText = commandText == null ? null : commandText.trim();
    }

    public Timestamp getExecuteTime() {
        return executeTime;
    }

    public void setExecuteTime(Timestamp executeTime) {
        this.executeTime = executeTime;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public String getExecuter() {
        return executer;
    }

    public void setExecuter(String executer) {
        this.executer = executer == null ? null : executer.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getResultType() {
        return resultType;
    }

    public void setResultType(Integer resultType) {
        this.resultType = resultType;
    }

    public String getOperateName() {
        return operateName;
    }

    public void setOperateName(String operateName) {
        this.operateName = operateName == null ? null : operateName.trim();
    }

    public String getResultContent() {
        return resultContent;
    }

    public void setResultContent(String resultContent) {
        this.resultContent = resultContent == null ? null : resultContent.trim();
    }
    
    public String getPortConfigureInfo() {
    	return portConfigureInfo;
    }
    
    public void setPortConfigureInfo(String portConfigureInfo) {
    	this.portConfigureInfo = portConfigureInfo;
    }
    public TBdTerminalCommand(){
    	
    }

}