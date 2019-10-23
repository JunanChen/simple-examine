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

    private String username;
    private String password;
    private String identifyCode;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentifyCode() {
        return identifyCode;
    }

    public void setIdentifyCode(String identifyCode) {
        this.identifyCode = identifyCode;
    }
}