package com.cdtu.simpleexamine.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

/**
 * 阿里巴巴json工具类
 *
 * @author junan
 * @since 19-3-8
 * @version  1.0.0
 */
public final class FastJsonUtil {
    /**
     * json字符串转实体类
     *
     * @param text  json字符串
     * @param clazz 目标实体类
     * @param <T>
     * @return
     */
    public static <T> T parseObject(String text, Class<T> clazz) {
        return JSON.parseObject(text, clazz);
    }

    /**
     * 对象转json字符串
     *
     * @param object 对象
     * @return
     */
    public static String toJSONString(Object object) {
        return JSON.toJSONString(object);
    }

    /**
     * json字符串转jsonObject
     *
     * @param jsonData
     * @return
     */
    public static JSONObject parseJsonObject(String jsonData) throws JSONException {
        return JSON.parseObject(jsonData);
    }

    /**
     * java对象转jsonObject
     *
     * @param object
     * @return
     */
    public static JSONObject praseJsonObject(Object object){
        return (JSONObject) JSON.toJSON(object);
    }

}
