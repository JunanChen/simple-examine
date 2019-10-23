package com.cdtu.simpleexamine;

import com.cdtu.simpleexamine.utils.MD5util;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.junit.Test;

/**
 * @author junan
 * @version V1.0
 * @className UUIDTest
 * @disc
 * @date 2019/10/15 10:01
 */
public class UUIDTest {

    @Test
    public void test() {
        System.out.println(UUIDUtil.get32UUID());
        System.out.println(UUIDUtil.get32UUID());
        System.out.println(UUIDUtil.get32UUID());
        System.out.println(UUIDUtil.get32UUID());
        System.out.println(UUIDUtil.get32UUID());
        System.out.println(UUIDUtil.get32UUID());
    }


    @Test
    public void md5test() {
        System.out.println(MD5util.encryptString("chenjunan", "junan"));
    }
}