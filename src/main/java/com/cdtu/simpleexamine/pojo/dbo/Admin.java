package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Data
public class Admin extends Model<Admin> {

    private static final long serialVersionUID = 1L;

    /**
     * 管理员表
     */
    @TableId
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
    private String realName;

    /**
     * admin头像地址
     */
    private String img;

    /**
     * admin描述
     */
    private String adminDesc;

    /**
     * 最后登录时间
     */
    private Integer lastLoginTime;

    /**
     * 最后登录时间
     */
    private String salt;

    private Integer sex;
    private Integer birthday;
    private String province;
    private String city;
    private String county;
    private String email;
    private String tele;

}
