package com.etms.terminalStatus.pojo;

public class TBdTerminalStatus {
    private Integer Statusid;

    private String Statusname;

    public Integer getStatusid() {
        return Statusid;
    }

    public void setStatusid(Integer Statusid) {
        this.Statusid = Statusid;
    }

    public String getStatusname() {
        return Statusname;
    }

    public void setStatusname(String Statusname) {
        this.Statusname = Statusname == null ? null : Statusname.trim();
    }
}