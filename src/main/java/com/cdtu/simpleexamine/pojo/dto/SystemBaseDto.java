package com.cdtu.simpleexamine.pojo.dto;

import com.cdtu.simpleexamine.enums.SystemCode;

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


    public static SystemBaseDto getOK(){
        return getOK(null, null);
    }

    public static SystemBaseDto getOK(Object data, String message){
        return new SystemBaseDto(SystemCode.OK.Value(),data, message);
    }

    public static SystemBaseDto getOK(String message){
        return getOK(null, message);
    }

    public static SystemBaseDto getFAIL(){
        return getFAIL("更新失败");
    }

    public static SystemBaseDto getFAIL(String message){
        return new SystemBaseDto(SystemCode.OPERATION_FAILURE.Value(), message);
    }

    public static SystemBaseDto getDataNull(){
        return getDataNull("未查询到相关数据！");
    }

    public static SystemBaseDto getDataNull(String message){
        return new SystemBaseDto(SystemCode.QUERY_DATA_NULL.Value(), message);
    }
}