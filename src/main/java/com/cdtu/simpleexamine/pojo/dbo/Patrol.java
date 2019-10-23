package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-20
 */
public class Patrol extends Model<Patrol> {

    private static final long serialVersionUID = 1L;

    /**
     * 巡检报告表编号
     */
    private String patrolId;

    /**
     * 巡检报告提交的时间
     */
    private Integer patrolTime;

    /**
     * 对应的巡检任务（由管理员发布的巡检任务编号）
     */
    private String patrolTask;

    /**
     * 巡检情况  0：正常     1：异常     2：紧急异常
     */
    private Integer patrolStatu;

    /**
     * 该巡检报告的提交人
     */
    private String patrolStaff;

    /**
     * 该报告是否已经处理（如果有异常） 0：未处理   1：待处理    2：已处理
     */
    private Integer patrolDeal;

    public String getPatrolId() {
        return patrolId;
    }

    public void setPatrolId(String patrolId) {
        this.patrolId = patrolId;
    }
    public Integer getPatrolTime() {
        return patrolTime;
    }

    public void setPatrolTime(Integer patrolTime) {
        this.patrolTime = patrolTime;
    }
    public String getPatrolTask() {
        return patrolTask;
    }

    public void setPatrolTask(String patrolTask) {
        this.patrolTask = patrolTask;
    }
    public Integer getPatrolStatu() {
        return patrolStatu;
    }

    public void setPatrolStatu(Integer patrolStatu) {
        this.patrolStatu = patrolStatu;
    }
    public String getPatrolStaff() {
        return patrolStaff;
    }

    public void setPatrolStaff(String patrolStaff) {
        this.patrolStaff = patrolStaff;
    }
    public Integer getPatrolDeal() {
        return patrolDeal;
    }

    public void setPatrolDeal(Integer patrolDeal) {
        this.patrolDeal = patrolDeal;
    }

    @Override
    protected Serializable pkVal() {
        return this.patrolId;
    }

    @Override
    public String toString() {
        return "Patrol{" +
            "patrolId=" + patrolId +
            ", patrolTime=" + patrolTime +
            ", patrolTask=" + patrolTask +
            ", patrolStatu=" + patrolStatu +
            ", patrolStaff=" + patrolStaff +
            ", patrolDeal=" + patrolDeal +
        "}";
    }
}
