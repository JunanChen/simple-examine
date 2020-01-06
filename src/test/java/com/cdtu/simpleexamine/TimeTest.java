package com.cdtu.simpleexamine;

import com.cdtu.simpleexamine.utils.TimeUtil;
import org.junit.Test;

/**
 * @author junan
 * @version V1.0
 * @className TimeTest
 * @disc
 * @date 2020/1/6 17:25
 */
public class TimeTest {

    @Test
    public void test1() {
        Long todayUnix = TimeUtil.getTodayUnix();
        System.out.println(todayUnix);

        Long nextDayUnix = TimeUtil.getNextDayUnix();
        System.out.println(nextDayUnix);
    }

}