package com.cdtu.simpleexamine.pojo.vo;

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
public class MessageVo extends Model<MessageVo> {

    private static final long serialVersionUID = 1L;

    private String messId;

    private String messName;

    private String messDesc;

    private String messTime;

    private Integer messStat;

    public String getMessId() {
        return messId;
    }

    public void setMessId(String messId) {
        this.messId = messId;
    }
    public String getMessName() {
        return messName;
    }

    public void setMessName(String messName) {
        this.messName = messName;
    }
    public String getMessDesc() {
        return messDesc;
    }

    public void setMessDesc(String messDesc) {
        this.messDesc = messDesc;
    }

    public String getMessTime() {
        return messTime;
    }

    public void setMessTime(String messTime) {
        this.messTime = messTime;
    }

    public Integer getMessStat() {
        return messStat;
    }

    public void setMessStat(Integer messStat) {
        this.messStat = messStat;
    }

    @Override
    protected Serializable pkVal() {
        return this.messId;
    }

    @Override
    public String toString() {
        return "Message{" +
            "messId=" + messId +
            ", messName=" + messName +
            ", messDesc=" + messDesc +
            ", messTime=" + messTime +
            ", messStat=" + messStat +
        "}";
    }
}
