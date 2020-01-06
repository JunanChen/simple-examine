package com.cdtu.simpleexamine.utils;

import org.joda.time.DateTime;

import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * unix时间戳转换工具类
 *
 * @author chenjunan
 */
public class TimeUtil {

    /**
     * 日期格式1
     */
    public static final String DATE_FORMAT_1 = "yyyy-MM-dd HH:mm:ss";

    /**
     * 日期格式2
     */
    public static final String DATE_FORMAT_2 = "yyyy-MM-dd";

    /**
     * 日期格式3
     */
    public static final String DATE_FORMAT_3 = "yyyy年MM月dd日";

    /**
     * 日期格式2
     */
    public static final String DATE_FORMAT_4 = "yyyyMMdd";

    public static final long ONE_SECOND = 1000l;


    /**
     * 获取时间戳 单位秒
     * @return
     */
    public static long getTimeStamp(){
        return System.currentTimeMillis() / ONE_SECOND;
    }


    /**
     * 时间戳转日期
     * @param timeStamp
     * @param format
     * @return
     */
    public static String timeStampToDate(String timeStamp,String format){

        if(timeStamp.isEmpty() || timeStamp == null || timeStamp.equals("null"))
            return "";
        if(format == null || format.isEmpty())
            format = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(format);

        return sdf.format(new Date(Long.valueOf(timeStamp+"000")));

    }

    /**
     * 时间戳转日期
     * @param timeStamp
     * @param format
     * @return
     */
    public static String timeStampToSimpleDate(String timeStamp,String format){

        if(timeStamp.isEmpty() || timeStamp == null || timeStamp.equals("null"))
            return "";
        if(format == null || format.isEmpty())
            format = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(format);

        return sdf.format(new Date(Long.valueOf(timeStamp+"000")));

    }


    /**
     * 日期转时间戳
     * @param date
     * @param format
     * @return
     */
    public static String dateTotimeStamp(String date,String format){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return String.valueOf(sdf.parse(date).getTime()/1000);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  "";
    }

    /**
     * 日期转时间戳
     * @param date
     * @return
     */
    public static String simpleDateTotimeStamp(String date){
        return dateTotimeStamp(date, DATE_FORMAT_1);
    }

    /**
     * 日期转时间戳
     * @param date
     * @return
     */
    public static Integer dateToStampWithSimple(String date){
        return Integer.valueOf(dateTotimeStamp(date, DATE_FORMAT_2));
    }

    /**
     * 返回当前年月日（yyMMdd）
     *
     * @return
     */
    public static String getDate() {
        return timeStampToSimpleDate(String.valueOf(getTimeStamp()), DATE_FORMAT_4);
    }

    /**
     * 获取当前日期对象
     *
     * @return
     */
    public static Date nowDate() {
        return new Date();
    }

    /**
     * 通过日期对象获取unix
     *
     * @param date
     * @param format
     * @return
     */
    public static Long getUnixByDate(Date date, String format) {
        SimpleDateFormat df = new SimpleDateFormat(format);
        String format1 = df.format(date);
        return Long.valueOf(dateTotimeStamp(format1, format));
    }

    /**
     * 获取今天的unix
     *
     * @return
     */
    public static Long getTodayUnix() {
        return getUnixByDate(nowDate(), DATE_FORMAT_2);
    }

    /**
     * 获取明天的unix
     *
     * @return
     */
    public static Long getNextDayUnix() {
        DateTime dateTime1 = new DateTime(nowDate()).plusDays(1);
        return getUnixByDate(dateTime1.toDate(), DATE_FORMAT_2);
    }

}
