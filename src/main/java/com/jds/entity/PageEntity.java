package com.jds.entity;

public class PageEntity {
    private int nowPage=1;
    private int rowSize=5;

    public int getNowPage() {
        return nowPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
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
