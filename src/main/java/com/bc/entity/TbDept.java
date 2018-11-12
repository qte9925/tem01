package com.bc.entity;

public class TbDept {
    private Integer tbDeptId;

    private Integer tbCompanyId;

    private String tbDeptName;

    private String tbDeptMen;

    private Integer tbDeptState;

    public Integer getTbDeptId() {
        return tbDeptId;
    }

    public void setTbDeptId(Integer tbDeptId) {
        this.tbDeptId = tbDeptId;
    }

    public Integer getTbCompanyId() {
        return tbCompanyId;
    }

    public void setTbCompanyId(Integer tbCompanyId) {
        this.tbCompanyId = tbCompanyId;
    }

    public String getTbDeptName() {
        return tbDeptName;
    }

    public void setTbDeptName(String tbDeptName) {
        this.tbDeptName = tbDeptName == null ? null : tbDeptName.trim();
    }

    public String getTbDeptMen() {
        return tbDeptMen;
    }

    public void setTbDeptMen(String tbDeptMen) {
        this.tbDeptMen = tbDeptMen == null ? null : tbDeptMen.trim();
    }

    public Integer getTbDeptState() {
        return tbDeptState;
    }

    public void setTbDeptState(Integer tbDeptState) {
        this.tbDeptState = tbDeptState;
    }
}