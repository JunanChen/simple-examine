package com.cdtu.simpleexamine.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * @author junan
 * @version V1.0
 * @className Page
 * @disc 分页对象
 * @date 2019/9/3 15:54
 */
public class Page<T> implements Serializable {

    private static final long serialVersionUID = -8865345580589135217L;
    //数据list
    private List<T> list;
    //搜索的对象
    private T t;
    //当前页
    private Integer pageNow;
    //总页数
    private Integer pageCount;
    //总记录数
    private Long totalCount;
    //页容量
    private Integer pageSize;
    //起始数据位置（这个主要用于Sql时的limit后第一个参数）
    private Integer beginRows;

    public Page() {
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageCount() {
        pageCount = (int)Math.ceil(totalCount / (double)pageSize);
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getBeginRows() {
        beginRows = (pageNow - 1) * pageSize;
        return beginRows;
    }

    public void setBeginRows(Integer beginRows) {
        this.beginRows = beginRows;
    }

    @Override
    public String toString() {
        return "Page{" +
                "list=" + list +
                ", pageNow=" + pageNow +
                ", totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                '}';
    }
}