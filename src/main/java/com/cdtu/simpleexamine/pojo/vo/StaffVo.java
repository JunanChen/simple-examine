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
public class StaffVo extends Model<StaffVo> {

    private static final long serialVersionUID = 1L;

    /**
     * 巡检员表的索引
     */
    private String staffId;

    /**
     * 巡检员的名字
     */
    private String staffName;

    /**
     * 员工密码
     */
    private String staffPassword;

    /**
     * 员工照片
     */
    private String staffImg;

    /**
     * 巡检员的性别    1：男    0：女
     */
    private Integer staffSex;

    /**
     * 隶属部门
     */
    private String staffDept;

    private String staffIdNumber;

    /**
     * 巡检员的家庭住址
     */
    private String staffAddress;

    private Long staffTele;

    /**
     * 巡检员的在职状态  0：在职   1：离职
     */
    private Integer staffStat;

    private String createBy;

    private String createTime;

    private String updateBy;

    private String updateTime;

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }
    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }
    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }
    public String getStaffImg() {
        return staffImg;
    }

    public void setStaffImg(String staffImg) {
        this.staffImg = staffImg;
    }
    public Integer getStaffSex() {
        return staffSex;
    }

    public void setStaffSex(Integer staffSex) {
        this.staffSex = staffSex;
    }
    public String getStaffDept() {
        return staffDept;
    }

    public void setStaffDept(String staffDept) {
        this.staffDept = staffDept;
    }
    public String getStaffIdNumber() {
        return staffIdNumber;
    }

    public void setStaffIdNumber(String staffIdNumber) {
        this.staffIdNumber = staffIdNumber;
    }
    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }
    public Long getStaffTele() {
        return staffTele;
    }

    public void setStaffTele(Long staffTele) {
        this.staffTele = staffTele;
    }
    public Integer getStaffStat() {
        return staffStat;
    }

    public void setStaffStat(Integer staffStat) {
        this.staffStat = staffStat;
    }
    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.staffId;
    }

    @Override
    public String toString() {
        return "Staff{" +
            "staffId=" + staffId +
            ", staffName=" + staffName +
            ", staffPassword=" + staffPassword +
            ", staffImg=" + staffImg +
            ", staffSex=" + staffSex +
            ", staffDept=" + staffDept +
            ", staffIdNumber=" + staffIdNumber +
            ", staffAddress=" + staffAddress +
            ", staffTele=" + staffTele +
            ", staffStat=" + staffStat +
            ", createBy=" + createBy +
            ", createTime=" + createTime +
            ", updateBy=" + updateBy +
            ", updateTime=" + updateTime +
        "}";
    }
}
