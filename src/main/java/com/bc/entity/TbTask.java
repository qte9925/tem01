package com.bc.entity;

import java.util.Date;

public class TbTask {
    private Integer tbTaskId;

    private Integer tbStaffId;

    private Integer tbStepId;

    private String tbTaskName;

    private String tbTaskText;

    private Date tbTaskStarttime;

    private Date tbTaskEndtime;

    private String tbTaskPro;

    private String tbTaskProd;

    private Integer tbTaskAchieve;

    private Integer tbTaskState;

    public Integer getTbTaskId() {
        return tbTaskId;
    }

    public void setTbTaskId(Integer tbTaskId) {
        this.tbTaskId = tbTaskId;
    }

    public Integer getTbStaffId() {
        return tbStaffId;
    }

    public void setTbStaffId(Integer tbStaffId) {
        this.tbStaffId = tbStaffId;
    }

    public Integer getTbStepId() {
        return tbStepId;
    }

    public void setTbStepId(Integer tbStepId) {
        this.tbStepId = tbStepId;
    }

    public String getTbTaskName() {
        return tbTaskName;
    }

    public void setTbTaskName(String tbTaskName) {
        this.tbTaskName = tbTaskName == null ? null : tbTaskName.trim();
    }

    public String getTbTaskText() {
        return tbTaskText;
    }

    public void setTbTaskText(String tbTaskText) {
        this.tbTaskText = tbTaskText == null ? null : tbTaskText.trim();
    }

    public Date getTbTaskStarttime() {
        return tbTaskStarttime;
    }

    public void setTbTaskStarttime(Date tbTaskStarttime) {
        this.tbTaskStarttime = tbTaskStarttime;
    }

    public Date getTbTaskEndtime() {
        return tbTaskEndtime;
    }

    public void setTbTaskEndtime(Date tbTaskEndtime) {
        this.tbTaskEndtime = tbTaskEndtime;
    }

    public String getTbTaskPro() {
        return tbTaskPro;
    }

    public void setTbTaskPro(String tbTaskPro) {
        this.tbTaskPro = tbTaskPro == null ? null : tbTaskPro.trim();
    }

    public String getTbTaskProd() {
        return tbTaskProd;
    }

    public void setTbTaskProd(String tbTaskProd) {
        this.tbTaskProd = tbTaskProd == null ? null : tbTaskProd.trim();
    }

    public Integer getTbTaskAchieve() {
        return tbTaskAchieve;
    }

    public void setTbTaskAchieve(Integer tbTaskAchieve) {
        this.tbTaskAchieve = tbTaskAchieve;
    }

    public Integer getTbTaskState() {
        return tbTaskState;
    }

    public void setTbTaskState(Integer tbTaskState) {
        this.tbTaskState = tbTaskState;
    }
}