package com.bc.entity;

import java.util.Date;

public class TbStaff {
    private Integer tbStaffId;


    private Integer tbReportId;

    private Integer tbTbStaffId;

    private String tbStaffName;

    private String tbStaffHrname;

    private String tbStaffSex;

    private String tbStaffCard;

    private String tbStaffImg;

    private String tbStaffEmail;

    private String tbStaffAddress;

    private String tbStaffPhone;

    private Date tbStaffBirthday;

    private Date tbStaffEntryday;

    private String tbStaffType;

    private Integer tbStaffState;

    public Integer getTbStaffId() {
        return tbStaffId;
    }

    public void setTbStaffId(Integer tbStaffId) {
        this.tbStaffId = tbStaffId;
    }

    public Integer getTbReportId() {
        return tbReportId;
    }

    public void setTbReportId(Integer tbReportId) {
        this.tbReportId = tbReportId;
    }

    public Integer getTbTbStaffId() {
        return tbTbStaffId;
    }

    public void setTbTbStaffId(Integer tbTbStaffId) {
        this.tbTbStaffId = tbTbStaffId;
    }

    public String getTbStaffName() {
        return tbStaffName;
    }

    public void setTbStaffName(String tbStaffName) {
        this.tbStaffName = tbStaffName == null ? null : tbStaffName.trim();
    }

    public String getTbStaffHrname() {
        return tbStaffHrname;
    }

    public void setTbStaffHrname(String tbStaffHrname) {
        this.tbStaffHrname = tbStaffHrname == null ? null : tbStaffHrname.trim();
    }

    public String getTbStaffSex() {
        return tbStaffSex;
    }

    public void setTbStaffSex(String tbStaffSex) {
        this.tbStaffSex = tbStaffSex == null ? null : tbStaffSex.trim();
    }

    public String getTbStaffCard() {
        return tbStaffCard;
    }

    public void setTbStaffCard(String tbStaffCard) {
        this.tbStaffCard = tbStaffCard == null ? null : tbStaffCard.trim();
    }

    public String getTbStaffImg() {
        return tbStaffImg;
    }

    public void setTbStaffImg(String tbStaffImg) {
        this.tbStaffImg = tbStaffImg == null ? null : tbStaffImg.trim();
    }

    public String getTbStaffEmail() {
        return tbStaffEmail;
    }

    public void setTbStaffEmail(String tbStaffEmail) {
        this.tbStaffEmail = tbStaffEmail == null ? null : tbStaffEmail.trim();
    }

    public String getTbStaffAddress() {
        return tbStaffAddress;
    }

    public void setTbStaffAddress(String tbStaffAddress) {
        this.tbStaffAddress = tbStaffAddress == null ? null : tbStaffAddress.trim();
    }

    public String getTbStaffPhone() {
        return tbStaffPhone;
    }

    public void setTbStaffPhone(String tbStaffPhone) {
        this.tbStaffPhone = tbStaffPhone == null ? null : tbStaffPhone.trim();
    }

    public Date getTbStaffBirthday() {
        return tbStaffBirthday;
    }

    public void setTbStaffBirthday(Date tbStaffBirthday) {
        this.tbStaffBirthday = tbStaffBirthday;
    }

    public Date getTbStaffEntryday() {
        return tbStaffEntryday;
    }

    public void setTbStaffEntryday(Date tbStaffEntryday) {
        this.tbStaffEntryday = tbStaffEntryday;
    }

    public String getTbStaffType() {
        return tbStaffType;
    }

    public void setTbStaffType(String tbStaffType) {
        this.tbStaffType = tbStaffType == null ? null : tbStaffType.trim();
    }

    public Integer getTbStaffState() {
        return tbStaffState;
    }

    public void setTbStaffState(Integer tbStaffState) {
        this.tbStaffState = tbStaffState;
    }
}