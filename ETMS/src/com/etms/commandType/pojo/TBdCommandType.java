package com.etms.commandType.pojo;

public class TBdCommandType {
    private Integer id;

    private String commandCode;

    private String typeName;

    private String commandText;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCommandCode() {
        return commandCode;
    }

    public void setCommandCode(String commandCode) {
        this.commandCode = commandCode == null ? null : commandCode.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getCommandText() {
        return commandText;
    }

    public void setCommandText(String commandText) {
        this.commandText = commandText == null ? null : commandText.trim();
    }
    
    public TBdCommandType(){
    	
    }
}