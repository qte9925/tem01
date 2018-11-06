package com.bc.entity;

public class TbDeptKh {
    private Integer tbDeptKhId;

    private Integer tbTaskId;

    private Integer tbDeptId;

    private String tbDeptKhName;

    private Integer tbDeptKhState;

    public Integer getTbDeptKhId() {
        return tbDeptKhId;
    }

    public void setTbDeptKhId(Integer tbDeptKhId) {
        this.tbDeptKhId = tbDeptKhId;
    }

    public Integer getTbTaskId() {
        return tbTaskId;
    }

    public void setTbTaskId(Integer tbTaskId) {
        this.tbTaskId = tbTaskId;
    }

    public Integer getTbDeptId() {
        return tbDeptId;
    }

    public void setTbDeptId(Integer tbDeptId) {
        this.tbDeptId = tbDeptId;
    }

    public String getTbDeptKhName() {
        return tbDeptKhName;
    }

    public void setTbDeptKhName(String tbDeptKhName) {
        this.tbDeptKhName = tbDeptKhName == null ? null : tbDeptKhName.trim();
    }

    public Integer getTbDeptKhState() {
        return tbDeptKhState;
    }

    public void setTbDeptKhState(Integer tbDeptKhState) {
        this.tbDeptKhState = tbDeptKhState;
    }
}