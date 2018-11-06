package com.bc.entity;

public class TbRecorddetails {
    private Integer tbRecorddetailsId;

    private Integer tbStaffId;

    private Integer tbDetailoneId;

    private Integer tbAchresultId;

    private String tbRecorddetailsSrsmark;

    private String tbRecorddetailsHsmark;

    private Integer tbRecorddetailsState;

    public Integer getTbRecorddetailsId() {
        return tbRecorddetailsId;
    }

    public void setTbRecorddetailsId(Integer tbRecorddetailsId) {
        this.tbRecorddetailsId = tbRecorddetailsId;
    }

    public Integer getTbStaffId() {
        return tbStaffId;
    }

    public void setTbStaffId(Integer tbStaffId) {
        this.tbStaffId = tbStaffId;
    }

    public Integer getTbDetailoneId() {
        return tbDetailoneId;
    }

    public void setTbDetailoneId(Integer tbDetailoneId) {
        this.tbDetailoneId = tbDetailoneId;
    }

    public Integer getTbAchresultId() {
        return tbAchresultId;
    }

    public void setTbAchresultId(Integer tbAchresultId) {
        this.tbAchresultId = tbAchresultId;
    }

    public String getTbRecorddetailsSrsmark() {
        return tbRecorddetailsSrsmark;
    }

    public void setTbRecorddetailsSrsmark(String tbRecorddetailsSrsmark) {
        this.tbRecorddetailsSrsmark = tbRecorddetailsSrsmark == null ? null : tbRecorddetailsSrsmark.trim();
    }
    public String getTbRecorddetailsHsmark() {
        return tbRecorddetailsHsmark;
    }

    public void setTbRecorddetailsHsmark(String tbRecorddetailsHsmark) {
        this.tbRecorddetailsHsmark = tbRecorddetailsHsmark == null ? null : tbRecorddetailsHsmark.trim();
    }


    public Integer getTbRecorddetailsState() {
        return tbRecorddetailsState;
    }

    public void setTbRecorddetailsState(Integer tbRecorddetailsState) {
        this.tbRecorddetailsState = tbRecorddetailsState;
    }
}