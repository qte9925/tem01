package com.bc.entity;

public class TbPropleYgkh {
    private Integer tbPropleYgkhId;

    private Integer tbTaskId;

    private Integer tbStaffId;

    private Integer tbDeptKhId;

    private String tbPropleYgkhName;

    private Integer tbPropleYgkhState;

    public Integer getTbPropleYgkhId() {
        return tbPropleYgkhId;
    }

    public void setTbPropleYgkhId(Integer tbPropleYgkhId) {
        this.tbPropleYgkhId = tbPropleYgkhId;
    }

    public Integer getTbTaskId() {
        return tbTaskId;
    }

    public void setTbTaskId(Integer tbTaskId) {
        this.tbTaskId = tbTaskId;
    }

    public Integer gettbStaffId() {
        return tbStaffId;
    }

    public void settbStaffId(Integer tbStaffId) {
        this.tbStaffId = tbStaffId;
    }

    public Integer getTbDeptKhId() {
        return tbDeptKhId;
    }

    public void setTbDeptKhId(Integer tbDeptKhId) {
        this.tbDeptKhId = tbDeptKhId;
    }

    public String getTbPropleYgkhName() {
        return tbPropleYgkhName;
    }

    public void setTbPropleYgkhName(String tbPropleYgkhName) {
        this.tbPropleYgkhName = tbPropleYgkhName == null ? null : tbPropleYgkhName.trim();
    }

    public Integer getTbPropleYgkhState() {
        return tbPropleYgkhState;
    }

    public void setTbPropleYgkhState(Integer tbPropleYgkhState) {
        this.tbPropleYgkhState = tbPropleYgkhState;
    }
}