package com.cdtu.simpleexamine.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.util.ByteSource;

/**
 * <p>
 * md5 加密类
 * </p>
 *
 * @author junan
 * @version 1.0.0
 * @since 19-5-14
 */
public class MD5util {

    /**
     * 使用 md5 加密 （加盐加密三次）
     *
     * @param password
     * @param salt     盐
     * @return
     */
    public static String encryptString(String password, String salt) {
        if (password == null)
            throw new RuntimeException("被加密密码不能为null!");
        return new Md5Hash(password, ByteSource.Util.bytes(salt + ""), 3).toString();
    }

}
