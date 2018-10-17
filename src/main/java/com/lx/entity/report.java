package com.lx.entity;

import java.math.BigDecimal;

public class report {
    private BigDecimal repId;

    private BigDecimal vregId;

    private BigDecimal oveId;

    private BigDecimal waiId;

    private BigDecimal regId;

    private String repPatha;

    private String repYuangongId;

    private String repYuangongName;

    private String repState;

    private BigDecimal repLateFre;

    private Boolean repLateTime;

    private BigDecimal repRetreatFre;

    private Boolean repRetreatTime;

    private Boolean repBsenTime;

    private BigDecimal repSignFre;

    private String repService;

    public report(BigDecimal repId, BigDecimal vregId, BigDecimal oveId, BigDecimal waiId, BigDecimal regId, String repPatha, String repYuangongId, String repYuangongName, String repState, BigDecimal repLateFre, Boolean repLateTime, BigDecimal repRetreatFre, Boolean repRetreatTime, Boolean repBsenTime, BigDecimal repSignFre, String repService) {
        this.repId = repId;
        this.vregId = vregId;
        this.oveId = oveId;
        this.waiId = waiId;
        this.regId = regId;
        this.repPatha = repPatha;
        this.repYuangongId = repYuangongId;
        this.repYuangongName = repYuangongName;
        this.repState = repState;
        this.repLateFre = repLateFre;
        this.repLateTime = repLateTime;
        this.repRetreatFre = repRetreatFre;
        this.repRetreatTime = repRetreatTime;
        this.repBsenTime = repBsenTime;
        this.repSignFre = repSignFre;
        this.repService = repService;
    }

    public report() {
        super();
    }

    public BigDecimal getRepId() {
        return repId;
    }

    public void setRepId(BigDecimal repId) {
        this.repId = repId;
    }

    public BigDecimal getVregId() {
        return vregId;
    }

    public void setVregId(BigDecimal vregId) {
        this.vregId = vregId;
    }

    public BigDecimal getOveId() {
        return oveId;
    }

    public void setOveId(BigDecimal oveId) {
        this.oveId = oveId;
    }

    public BigDecimal getWaiId() {
        return waiId;
    }

    public void setWaiId(BigDecimal waiId) {
        this.waiId = waiId;
    }

    public BigDecimal getRegId() {
        return regId;
    }

    public void setRegId(BigDecimal regId) {
        this.regId = regId;
    }

    public String getRepPatha() {
        return repPatha;
    }

    public void setRepPatha(String repPatha) {
        this.repPatha = repPatha == null ? null : repPatha.trim();
    }

    public String getRepYuangongId() {
        return repYuangongId;
    }

    public void setRepYuangongId(String repYuangongId) {
        this.repYuangongId = repYuangongId == null ? null : repYuangongId.trim();
    }

    public String getRepYuangongName() {
        return repYuangongName;
    }

    public void setRepYuangongName(String repYuangongName) {
        this.repYuangongName = repYuangongName == null ? null : repYuangongName.trim();
    }

    public String getRepState() {
        return repState;
    }

    public void setRepState(String repState) {
        this.repState = repState == null ? null : repState.trim();
    }

    public BigDecimal getRepLateFre() {
        return repLateFre;
    }

    public void setRepLateFre(BigDecimal repLateFre) {
        this.repLateFre = repLateFre;
    }

    public Boolean getRepLateTime() {
        return repLateTime;
    }

    public void setRepLateTime(Boolean repLateTime) {
        this.repLateTime = repLateTime;
    }

    public BigDecimal getRepRetreatFre() {
        return repRetreatFre;
    }

    public void setRepRetreatFre(BigDecimal repRetreatFre) {

        this.repRetreatFre = repRetreatFre;
    }

    public Boolean getRepRetreatTime() {

        return repRetreatTime;
    }

    public void setRepRetreatTime(Boolean repRetreatTime) {

        this.repRetreatTime = repRetreatTime;
    }

    public Boolean getRepBsenTime() {

        return repBsenTime;
    }

    public void setRepBsenTime(Boolean repBsenTime) {

        this.repBsenTime = repBsenTime;
    }

    public BigDecimal getRepSignFre() {
        return repSignFre;
    }

    public void setRepSignFre(BigDecimal repSignFre) {
        this.repSignFre = repSignFre;
    }

    public String getRepService() {
        return repService;
    }

    public void setRepService(String repService) {
        this.repService = repService == null ? null : repService.trim();
    }
}