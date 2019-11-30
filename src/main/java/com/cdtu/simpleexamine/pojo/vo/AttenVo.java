package com.cdtu.simpleexamine.pojo.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-25
 */
public class AttenVo extends Model<AttenVo> {

    private static final long serialVersionUID = 1L;

    @TableId
    private String attenId;

    private String attenStaff;

    private String attenDesc;

    private String createTime;

    private String createBy;

    private String updateTime;

    private String updateBy;

    public String getAttenId() {
        return attenId;
    }

    public void setAttenId(String attenId) {
        this.attenId = attenId;
    }
    public String getAttenStaff() {
        return attenStaff;
    }

    public void setAttenStaff(String attenStaff) {
        this.attenStaff = attenStaff;
    }
    public String getAttenDesc() {
        return attenDesc;
    }

    public void setAttenDesc(String attenDesc) {
        this.attenDesc = attenDesc;
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
        return this.attenId;
    }

    @Override
    public String toString() {
        return "Atten{" +
            "attenId=" + attenId +
            ", attenStaff=" + attenStaff +
            ", attenDesc=" + attenDesc +
            ", createTime=" + createTime +
            ", createBy=" + createBy +
            ", updateTime=" + updateTime +
            ", updateBy=" + updateBy +
        "}";
    }
}
