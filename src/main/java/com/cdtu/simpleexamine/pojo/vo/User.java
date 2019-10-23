package com.cdtu.simpleexamine.pojo.vo;

import lombok.Data;

/**
 * @author junan
 * @version V1.0
 * @className AdminVo
 * @disc    封装登录数据对象
 * @date 2019/10/15 11:47
 */
@Data
public class User {

    private String name = "admin";
    private String roles[] = {"admin"};
    private String avatar = "https://mirror-gold-cdn.xitu.io/168e088859e325b9d85?imageView2/1/w/100/h/100/q/85/format/webp/interlace/1";

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String[] getRoles() {
        return roles;
    }

    public void setRoles(String[] roles) {
        this.roles = roles;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}