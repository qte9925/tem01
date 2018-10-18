package com.jds.entity;

public class PageEntity {
    private int nowPage=1;
    private int rowSize=2;

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getRowSize() {
        return rowSize;
    }

    public void setRowSize(int rowSize) {
        this.rowSize = rowSize;
    }

    private int pageCount;
    private int rowCount;

}
