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
public class EquVo extends Model<EquVo> {

    private static final long serialVersionUID = 1L;

    private String equId;

    private String equName;

    private String equDesc;

    private String equPoint;

    private Integer equStat;

    private String createTime;

    private String createBy;

    private String updateTime;

    private String updateBy;

    public String getEquId() {
        return equId;
    }

    public void setEquId(String equId) {
        this.equId = equId;
    }

    public String getEquName() {
        return equName;
    }

    public void setEquName(String equName) {
        this.equName = equName;
    }

    public String getEquDesc() {
        return equDesc;
    }

    public void setEquDesc(String equDesc) {
        this.equDesc = equDesc;
    }

    public String getEquPoint() {
        return equPoint;
    }

    public void setEquPoint(String equPoint) {
        this.equPoint = equPoint;
    }

    public Integer getEquStat() {
        return equStat;
    }

    public void setEquStat(Integer equStat) {
        this.equStat = equStat;
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
        return this.equId;
    }

    @Override
    public String toString() {
        return "Equ{" +
            "equId=" + equId +
            ", equName=" + equName +
            ", equDesc=" + equDesc +
            ", equPoint=" + equPoint +
            ", equStat=" + equStat +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
