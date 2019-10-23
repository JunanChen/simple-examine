package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
public class Admin extends Model<Admin> {

    private static final long serialVersionUID = 1L;

    /**
     * 管理员表
     */
    private String adminId;

    /**
     * 管理员登录名
     */
    private String adminName;

    /**
     * 管理员密码（md5加密）
     */
    private String adminPwd;

    /**
     * 管理员权限  0：最高权限  1：任务发布权限  2：临时权限
     */
    private Integer adminPower;

    /**
     * 管理员账号状态  0：可用   1：禁用
     */
    private Integer adminStatu;

    /**
     * 真实姓名
     */
    private String adminRealname;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }
    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }
    public Integer getAdminPower() {
        return adminPower;
    }

    public void setAdminPower(Integer adminPower) {
        this.adminPower = adminPower;
    }
    public Integer getAdminStatu() {
        return adminStatu;
    }

    public void setAdminStatu(Integer adminStatu) {
        this.adminStatu = adminStatu;
    }
    public String getAdminRealname() {
        return adminRealname;
    }

    public void setAdminRealname(String adminRealname) {
        this.adminRealname = adminRealname;
    }

    @Override
    protected Serializable pkVal() {
        return this.adminId;
    }

    @Override
    public String toString() {
        return "Admin{" +
            "adminId=" + adminId +
            ", adminName=" + adminName +
            ", adminPwd=" + adminPwd +
            ", adminPower=" + adminPower +
            ", adminStatu=" + adminStatu +
            ", adminRealname=" + adminRealname +
        "}";
    }
}
