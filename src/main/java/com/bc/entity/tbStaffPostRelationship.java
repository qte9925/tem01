package com.bc.entity;

public class tbStaffPostRelationship {
    private int tbStaffPostRelationshipId;
    private int tbStaffId;
    private int tbPostId;

    public int getTbStaffPostRelationshipId() {
        return tbStaffPostRelationshipId;
    }

    public void setTbStaffPostRelationshipId(int tbStaffPostRelationshipId) {
        this.tbStaffPostRelationshipId = tbStaffPostRelationshipId;
    }

    public int getTbStaffId() {
        return tbStaffId;
    }

    public void setTbStaffId(int tbStaffId) {
        this.tbStaffId = tbStaffId;
    }

    public int getTbPostId() {
        return tbPostId;
    }

    public void setTbPostId(int tbPostId) {
        this.tbPostId = tbPostId;
    }
}
