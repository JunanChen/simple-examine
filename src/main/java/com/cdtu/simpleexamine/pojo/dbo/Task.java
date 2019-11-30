package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.annotation.TableId;
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
public class Task extends Model<Task> {

    private static final long serialVersionUID = 1L;

    /**
     * 任务编号
     */
    @TableId
    private String taskId;

    /**
     * 该任务指派的巡检人员的编号
     */
    private String taskStaff;

    /**
     * 任务需要巡检的线路
     */
    private String taskLine;

    /**
     * 任务发布时间
     */
    private Integer createTime;


    private String createBy;

    private Integer startTime;

    private Integer endTime;

    /**
     * 任务描述
     */
    private String taskDesc;

    /**
     * 任务状态   0：未执行     1:执行中   2：已执行
     */
    private Integer taskStat;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
    public String getTaskStaff() {
        return taskStaff;
    }

    public void setTaskStaff(String taskStaff) {
        this.taskStaff = taskStaff;
    }
    public String getTaskLine() {
        return taskLine;
    }

    public void setTaskLine(String taskLine) {
        this.taskLine = taskLine;
    }
    public Integer getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Integer createTime) {
        this.createTime = createTime;
    }
    public Integer getStartTime() {
        return startTime;
    }

    public void setStartTime(Integer startTime) {
        this.startTime = startTime;
    }
    public Integer getEndTime() {
        return endTime;
    }

    public void setEndTime(Integer endTime) {
        this.endTime = endTime;
    }
    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }
    public Integer getTaskStat() {
        return taskStat;
    }

    public void setTaskStat(Integer taskStat) {
        this.taskStat = taskStat;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

}
