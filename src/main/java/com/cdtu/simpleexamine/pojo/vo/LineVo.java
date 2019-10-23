package com.cdtu.simpleexamine.pojo.vo;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public class LineVo extends Model<LineVo> {

    private static final long serialVersionUID = 1L;

    /**
     * 线路表索引
     */
    private String lineId;

    /**
     * 线路名
     */
    private String lineName;

    private String lineDesc;

    /**
     * 线路所属的分区
     */
    private String lineArea;

    /**
     * 该线路状态  0：可用  1：不可用   2：维护中
     */
    private Integer lineStat;

    private String createTime;

    private String createBy;

    private String updateTime;

    private String updateBy;

    public String getLineId() {
        return lineId;
    }

    public void setLineId(String lineId) {
        this.lineId = lineId;
    }
    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }
    public String getLineDesc() {
        return lineDesc;
    }

    public void setLineDesc(String lineDesc) {
        this.lineDesc = lineDesc;
    }
    public String getLineArea() {
        return lineArea;
    }

    public void setLineArea(String lineArea) {
        this.lineArea = lineArea;
    }
    public Integer getLineStat() {
        return lineStat;
    }

    public void setLineStat(Integer lineStat) {
        this.lineStat = lineStat;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    protected Serializable pkVal() {
        return this.lineId;
    }

    @Override
    public String toString() {
        return "Line{" +
            "lineId=" + lineId +
            ", lineName=" + lineName +
            ", lineDesc=" + lineDesc +
            ", lineArea=" + lineArea +
            ", lineStat=" + lineStat +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
