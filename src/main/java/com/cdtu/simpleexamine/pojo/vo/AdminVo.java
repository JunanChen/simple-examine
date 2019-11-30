package com.cdtu.simpleexamine.pojo.vo;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author junan
 * @version V1.0
 * @className AdminVo
 * @disc    封装登录数据对象
 * @date 2019/10/15 11:47
 */
@Data
public class AdminVo implements Serializable {

    private String adminName;
    private String password;
    private String realName;
    private String identifyCode;
    private String sessionId;
    private String ipAddress;
    private String img;
    private String lastLoginTime;
    private String role;
    private Integer sex;
    private String birthday;
    private String province;
    private String city;
    private String county;
    private String email;
    private String tele;
    private String adminDesc;
    private String adminId;

}