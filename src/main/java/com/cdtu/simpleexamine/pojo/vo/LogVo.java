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
 * @since 2019-10-30
 */
public class LogVo extends Model<LogVo> {

    private static final long serialVersionUID = 1L;

    @TableId
    private String logId;

    private String logTime;

    private String logUrl;

    private String logIp;

    private Integer logMethod;

    private Integer logUsetime;

    private String logAdmin;

    private String logDesc;

    private Integer logStat;

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getLogTime() {
        return logTime;
    }

    public void setLogTime(String logTime) {
        this.logTime = logTime;
    }

    public String getLogUrl() {
        return logUrl;
    }

    public void setLogUrl(String logUrl) {
        this.logUrl = logUrl;
    }
    public String getLogAdmin() {
        return logAdmin;
    }

    public void setLogAdmin(String logAdmin) {
        this.logAdmin = logAdmin;
    }
    public String getLogDesc() {
        return logDesc;
    }

    public void setLogDesc(String logDesc) {
        this.logDesc = logDesc;
    }
    public Integer getLogStat() {
        return logStat;
    }

    public void setLogStat(Integer logStat) {
        this.logStat = logStat;
    }

    public String getLogIp() {
        return logIp;
    }

    public void setLogIp(String logIp) {
        this.logIp = logIp;
    }

    @Override
    protected Serializable pkVal() {
        return this.logId;
    }

    public Integer getLogMethod() {
        return logMethod;
    }

    public void setLogMethod(Integer logMethod) {
        this.logMethod = logMethod;
    }

    public Integer getLogUsetime() {
        return logUsetime;
    }

    public void setLogUsetime(Integer logUsetime) {
        this.logUsetime = logUsetime;
    }

    @Override
    public String toString() {
        return "Log{" +
                "logId='" + logId + '\'' +
                ", logTime=" + logTime +
                ", logUrl='" + logUrl + '\'' +
                ", logIp='" + logIp + '\'' +
                ", logMethod=" + logMethod +
                ", logUsetime=" + logUsetime +
                ", logAdmin='" + logAdmin + '\'' +
                ", logDesc='" + logDesc + '\'' +
                ", logStat=" + logStat +
                '}';
    }
}
