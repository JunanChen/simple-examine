package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "permission_id", type = IdType.AUTO)
    private Integer permissionId;

    /**
     * 权限名
     */
    private String permissionName;

    /**
     * 权限的描述
     */
    private String permissionDesc;

    /**
     * 权限的状态 0：可用  1：禁用
     */
    private Integer permissionStatu;

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }
    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }
    public String getPermissionDesc() {
        return permissionDesc;
    }

    public void setPermissionDesc(String permissionDesc) {
        this.permissionDesc = permissionDesc;
    }
    public Integer getPermissionStatu() {
        return permissionStatu;
    }

    public void setPermissionStatu(Integer permissionStatu) {
        this.permissionStatu = permissionStatu;
    }

    @Override
    protected Serializable pkVal() {
        return this.permissionId;
    }

    @Override
    public String toString() {
        return "Permission{" +
            "permissionId=" + permissionId +
            ", permissionName=" + permissionName +
            ", permissionDesc=" + permissionDesc +
            ", permissionStatu=" + permissionStatu +
        "}";
    }
}
