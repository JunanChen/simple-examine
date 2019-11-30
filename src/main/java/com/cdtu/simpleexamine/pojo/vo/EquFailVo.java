package com.cdtu.simpleexamine.pojo.vo;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Equ;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-11-01
 */
public class EquFailVo extends Model<EquFailVo> {

    private static final long serialVersionUID = 1L;

    private String failId;

    private String failEqu;

    private String failAppearTime;

    private String failDealTime;

    private String dealBy;

    private Integer failStat;

    private Equ equ;

    private Admin admin;

    public String getFailId() {
        return failId;
    }

    public void setFailId(String failId) {
        this.failId = failId;
    }
    public String getFailEqu() {
        return failEqu;
    }

    public void setFailEqu(String failEqu) {
        this.failEqu = failEqu;
    }

    public String getFailAppearTime() {
        return failAppearTime;
    }

    public void setFailAppearTime(String failAppearTime) {
        this.failAppearTime = failAppearTime;
    }

    public String getFailDealTime() {
        return failDealTime;
    }

    public void setFailDealTime(String failDealTime) {
        this.failDealTime = failDealTime;
    }

    public Integer getFailStat() {
        return failStat;
    }

    public void setFailStat(Integer failStat) {
        this.failStat = failStat;
    }

    @Override
    protected Serializable pkVal() {
        return this.failId;
    }

    public String getDealBy() {
        return dealBy;
    }

    public void setDealBy(String dealBy) {
        this.dealBy = dealBy;
    }

    public Equ getEqu() {
        return equ;
    }

    public void setEqu(Equ equ) {
        this.equ = equ;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
