package com.bc.entity;

public class TbDetailone {
    private Integer tbDetailoneId;

    private Integer tbEventId;

    private Integer tbTaskId;

    private String tbDetailoneName;

    private String tbDetailoneValue;

    private String tbDetailoneMark;

    private Integer tbDetailoneState;

    public Integer getTbDetailoneId() {
        return tbDetailoneId;
    }

    public void setTbDetailoneId(Integer tbDetailoneId) {
        this.tbDetailoneId = tbDetailoneId;
    }

    public Integer getTbEventId() {
        return tbEventId;
    }

    public void setTbEventId(Integer tbEventId) {
        this.tbEventId = tbEventId;
    }

    public Integer getTbTaskId() {
        return tbTaskId;
    }

    public void setTbTaskId(Integer tbTaskId) {
        this.tbTaskId = tbTaskId;
    }

    public String getTbDetailoneName() {
        return tbDetailoneName;
    }

    public void setTbDetailoneName(String tbDetailoneName) {
        this.tbDetailoneName = tbDetailoneName == null ? null : tbDetailoneName.trim();
    }

    public String getTbDetailoneValue() {
        return tbDetailoneValue;
    }

    public void setTbDetailoneValue(String tbDetailoneValue) {
        this.tbDetailoneValue = tbDetailoneValue == null ? null : tbDetailoneValue.trim();
    }

    public String getTbDetailoneMark() {
        return tbDetailoneMark;
    }

    public void setTbDetailoneMark(String tbDetailoneMark) {
        this.tbDetailoneMark = tbDetailoneMark == null ? null : tbDetailoneMark.trim();
    }

    public Integer getTbDetailoneState() {
        return tbDetailoneState;
    }

    public void setTbDetailoneState(Integer tbDetailoneState) {
        this.tbDetailoneState = tbDetailoneState;
    }
}