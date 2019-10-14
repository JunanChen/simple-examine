package com.cdtu.simpleexamine.pojo.dto;

import java.io.Serializable;

/**
 * @author junan
 * @version V1.0
 * @className SystemBaseDto
 * @disc
 * @date 2019/9/3 10:18
 */
public class SystemBaseDto implements Serializable {

    private static final long serialVersionUID = 6155113124843693159L;
    private Integer code;
    private Object data;
    private String message;

    public SystemBaseDto() {
    }

    public SystemBaseDto(Integer code) {
        this(code, null, null);
    }

    public SystemBaseDto(Integer code, String message) {
        this(code, null, message);
    }

    public SystemBaseDto(Integer code, Object data, String message) {
        this.code = code;
        this.data = data;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "SystemBaseDto{" +
                "code=" + code +
                ", data=" + data +
                ", message='" + message + '\'' +
                '}';
    }
}