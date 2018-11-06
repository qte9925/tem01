package com.bc.entity;

public class TbApplicantsforlanding {
    private Integer tbApplicantsforlandingId;

    private String tbApplicantsforlandingUsername;

    private String tbApplicantsforlandingPwd;

    private String tbApplicantsforlandingCard;

    private String tbApplicantsforlandingName;

    private Integer tbApplicantsforlandingState;

    public Integer getTbApplicantsforlandingId() {
        return tbApplicantsforlandingId;
    }

    public void setTbApplicantsforlandingId(Integer tbApplicantsforlandingId) {
        this.tbApplicantsforlandingId = tbApplicantsforlandingId;
    }

    public String getTbApplicantsforlandingUsername() {
        return tbApplicantsforlandingUsername;
    }

    public void setTbApplicantsforlandingUsername(String tbApplicantsforlandingUsername) {
        this.tbApplicantsforlandingUsername = tbApplicantsforlandingUsername == null ? null : tbApplicantsforlandingUsername.trim();
    }

    public String getTbApplicantsforlandingPwd() {
        return tbApplicantsforlandingPwd;
    }

    public void setTbApplicantsforlandingPwd(String tbApplicantsforlandingPwd) {
        this.tbApplicantsforlandingPwd = tbApplicantsforlandingPwd == null ? null : tbApplicantsforlandingPwd.trim();
    }

    public String getTbApplicantsforlandingCard() {
        return tbApplicantsforlandingCard;
    }

    public void setTbApplicantsforlandingCard(String tbApplicantsforlandingCard) {
        this.tbApplicantsforlandingCard = tbApplicantsforlandingCard == null ? null : tbApplicantsforlandingCard.trim();
    }

    public String getTbApplicantsforlandingName() {
        return tbApplicantsforlandingName;
    }

    public void setTbApplicantsforlandingName(String tbApplicantsforlandingName) {
        this.tbApplicantsforlandingName = tbApplicantsforlandingName == null ? null : tbApplicantsforlandingName.trim();
    }

    public Integer getTbApplicantsforlandingState() {
        return tbApplicantsforlandingState;
    }

    public void setTbApplicantsforlandingState(Integer tbApplicantsforlandingState) {
        this.tbApplicantsforlandingState = tbApplicantsforlandingState;
    }
}