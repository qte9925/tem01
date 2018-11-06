package com.bc.entity;

public class TbStep {
    private Integer tbStepId;

    private String tbStepNam;

    private String tbStepRemarks;

    private Integer tbStepState;

    public Integer getTbStepId() {
        return tbStepId;
    }

    public void setTbStepId(Integer tbStepId) {
        this.tbStepId = tbStepId;
    }

    public String getTbStepNam() {
        return tbStepNam;
    }

    public void setTbStepNam(String tbStepNam) {
        this.tbStepNam = tbStepNam == null ? null : tbStepNam.trim();
    }

    public String getTbStepRemarks() {
        return tbStepRemarks;
    }

    public void setTbStepRemarks(String tbStepRemarks) {
        this.tbStepRemarks = tbStepRemarks == null ? null : tbStepRemarks.trim();
    }

    public Integer getTbStepState() {
        return tbStepState;
    }

    public void setTbStepState(Integer tbStepState) {
        this.tbStepState = tbStepState;
    }
}