package com.bc.entity;

public class TbPost {
    private Integer tbPostId;

    private Integer tbDeptId;

    private String tbPostName;

    private Integer tbPostState;

    private Integer tbPostUpper;

    private Integer tbPostOnjob;

    public Integer getTbPostId() {
        return tbPostId;
    }

    public void setTbPostId(Integer tbPostId) {
        this.tbPostId = tbPostId;
    }

    public Integer getTbDeptId() {
        return tbDeptId;
    }

    public void setTbDeptId(Integer tbDeptId) {
        this.tbDeptId = tbDeptId;
    }

    public String getTbPostName() {
        return tbPostName;
    }

    public void setTbPostName(String tbPostName) {
        this.tbPostName = tbPostName == null ? null : tbPostName.trim();
    }

    public Integer getTbPostState() {
        return tbPostState;
    }

    public void setTbPostState(Integer tbPostState) {
        this.tbPostState = tbPostState;
    }

    public Integer getTbPostUpper() {
        return tbPostUpper;
    }

    public void setTbPostUpper(Integer tbPostUpper) {
        this.tbPostUpper = tbPostUpper;
    }

    public Integer getTbPostOnjob() {
        return tbPostOnjob;
    }

    public void setTbPostOnjob(Integer tbPostOnjob) {
        this.tbPostOnjob = tbPostOnjob;
    }
}