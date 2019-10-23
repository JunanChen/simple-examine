package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-21
 */
public class PatrolItem extends Model<PatrolItem> {

    private static final long serialVersionUID = 1L;

    /**
     * 对巡检报的每一项的保存
     */
    private String itemId;

    /**
     * 对应的巡检报告id
     */
    private String itemPatrol;

    /**
     * 巡检报告的问题编号
     */
    private Integer itemQuestionId;

    /**
     * 巡检报的问题选中项
     */
    private Integer itemQuestionSelect;

    private String itemQuestionDesc;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
    public String getItemPatrol() {
        return itemPatrol;
    }

    public void setItemPatrol(String itemPatrol) {
        this.itemPatrol = itemPatrol;
    }
    public Integer getItemQuestionId() {
        return itemQuestionId;
    }

    public void setItemQuestionId(Integer itemQuestionId) {
        this.itemQuestionId = itemQuestionId;
    }
    public Integer getItemQuestionSelect() {
        return itemQuestionSelect;
    }

    public void setItemQuestionSelect(Integer itemQuestionSelect) {
        this.itemQuestionSelect = itemQuestionSelect;
    }
    public String getItemQuestionDesc() {
        return itemQuestionDesc;
    }

    public void setItemQuestionDesc(String itemQuestionDesc) {
        this.itemQuestionDesc = itemQuestionDesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.itemId;
    }

    @Override
    public String toString() {
        return "PatrolItem{" +
            "itemId=" + itemId +
            ", itemPatrol=" + itemPatrol +
            ", itemQuestionId=" + itemQuestionId +
            ", itemQuestionSelect=" + itemQuestionSelect +
            ", itemQuestionDesc=" + itemQuestionDesc +
        "}";
    }
}
