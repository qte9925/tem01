package com.bc.entity;

public class TbEvent {
    private Integer tbEventId;

    private String tbEventName;

    private String tbEventValue;

    private Integer tbEventMark;

    private Integer tbEventState;

    public Integer getTbEventId() {
        return tbEventId;
    }

    public void setTbEventId(Integer tbEventId) {
        this.tbEventId = tbEventId;
    }

    public String getTbEventName() {
        return tbEventName;
    }

    public void setTbEventName(String tbEventName) {
        this.tbEventName = tbEventName == null ? null : tbEventName.trim();
    }

    public String getTbEventValue() {
        return tbEventValue;
    }

    public void setTbEventValue(String tbEventValue) {
        this.tbEventValue = tbEventValue == null ? null : tbEventValue.trim();
    }

    public Integer getTbEventMark() {
        return tbEventMark;
    }

    public void setTbEventMark(Integer tbEventMark) {
        this.tbEventMark = tbEventMark;
    }

    public Integer getTbEventState() {
        return tbEventState;
    }

    public void setTbEventState(Integer tbEventState) {
        this.tbEventState = tbEventState;
    }
}