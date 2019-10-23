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
public class Roles extends Model<Roles> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer roleId;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String roleDesc;

    /**
     * 角色状态  0：可用   1：禁用
     */
    private Integer roleStatu;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }
    public Integer getRoleStatu() {
        return roleStatu;
    }

    public void setRoleStatu(Integer roleStatu) {
        this.roleStatu = roleStatu;
    }

    @Override
    protected Serializable pkVal() {
        return this.roleId;
    }

    @Override
    public String toString() {
        return "Roles{" +
            "roleId=" + roleId +
            ", roleName=" + roleName +
            ", roleDesc=" + roleDesc +
            ", roleStatu=" + roleStatu +
        "}";
    }
}
