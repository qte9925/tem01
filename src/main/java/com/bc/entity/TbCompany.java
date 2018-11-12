package com.bc.entity;

public class TbCompany {
    private Integer tbCompanyId;

    private String tbCompanyName;

    private Integer tbCompanyState;

    public Integer getTbCompanyId() {
        return tbCompanyId;
    }

    public void setTbCompanyId(Integer tbCompanyId) {
        this.tbCompanyId = tbCompanyId;
    }

    public String getTbCompanyName() {
        return tbCompanyName;
    }

    public void setTbCompanyName(String tbCompanyName) {
        this.tbCompanyName = tbCompanyName == null ? null : tbCompanyName.trim();
    }

    public Integer getTbCompanyState() {
        return tbCompanyState;
    }

    public void setTbCompanyState(Integer tbCompanyState) {
        this.tbCompanyState = tbCompanyState;
    }
}