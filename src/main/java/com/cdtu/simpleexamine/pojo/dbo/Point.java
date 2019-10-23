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
public class Point extends Model<Point> {

    private static final long serialVersionUID = 1L;

    private String pointId;

    /**
     * 点位名
     */
    private String pointName;

    private String pointDesc;

    /**
     * 所属线路
     */
    private String pointLine;

    /**
     * 点位的状态  0：可用   1：不可用  2：维护中
     */
    private Integer pointStat;

    private Integer createTime;

    private String createBy;

    private Integer updateTime;

    private String updateBy;

    public String getPointId() {
        return pointId;
    }

    public void setPointId(String pointId) {
        this.pointId = pointId;
    }
    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName;
    }
    public String getPointDesc() {
        return pointDesc;
    }

    public void setPointDesc(String pointDesc) {
        this.pointDesc = pointDesc;
    }
    public String getPointLine() {
        return pointLine;
    }

    public void setPointLine(String pointLine) {
        this.pointLine = pointLine;
    }
    public Integer getPointStat() {
        return pointStat;
    }

    public void setPointStat(Integer pointStat) {
        this.pointStat = pointStat;
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
        return this.pointId;
    }

    @Override
    public String toString() {
        return "Point{" +
            "pointId=" + pointId +
            ", pointName=" + pointName +
            ", pointDesc=" + pointDesc +
            ", pointLine=" + pointLine +
            ", pointStat=" + pointStat +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
