package com.cdtu.simpleexamine.pojo.dbo;

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
public class Area extends Model<Area> {

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

    private Integer createTime;

    private String createBy;

    private Integer updateTime;

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
    public Integer getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Integer createTime) {
        this.createTime = createTime;
    }
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    public Integer getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Integer updateTime) {
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
        return this.areaId;
    }

    @Override
    public String toString() {
        return "Area{" +
            "areaId=" + areaId +
            ", areaName=" + areaName +
            ", areaAddress=" + areaAddress +
            ", areaDesc=" + areaDesc +
            ", areaStat=" + areaStat +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
