package com.cdtu.simpleexamine.pojo.vo;

import java.io.Serializable;

/**
 * @author junan
 * @version V1.0
 * @className AreaVo
 * @disc
 * @date 2019/10/22 9:56
 */
public class AreaVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String areaId;

    /**
     * 分区名
     */
    private String areaName;

    private String areaAddress;

    private String areaDesc;

    /**
     *  分区状态  0：启用  1：禁用
     */
    private Integer areaStat;

    private String createTime;

    private String createBy;

    private String updateTime;

    private String updateBy;

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaAddress() {
        return areaAddress;
    }

    public void setAreaAddress(String areaAddress) {
        this.areaAddress = areaAddress;
    }

    public String getAreaDesc() {
        return areaDesc;
    }

    public void setAreaDesc(String areaDesc) {
        this.areaDesc = areaDesc;
    }

    public Integer getAreaStat() {
        return areaStat;
    }

    public void setAreaStat(Integer areaStat) {
        this.areaStat = areaStat;
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
}