package com.cdtu.simpleexamine.exception;

/**
 * @author junan
 * @version V1.0
 * @className SystemBaseException
 * @disc    系统基本异常
 * @date 2019/10/15 11:02
 */
public class SystemBaseException extends RuntimeException{

    public SystemBaseException() {
        super();
    }

    public SystemBaseException(String message) {
        super(message);
    }

    public SystemBaseException(String message, Throwable cause) {
        super(message, cause);
    }
}