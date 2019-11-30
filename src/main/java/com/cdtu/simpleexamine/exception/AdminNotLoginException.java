package com.cdtu.simpleexamine.exception;

/**
 * @author junan
 * @version V1.0
 * @className AdminNotLoginException
 * @disc
 * @date 2019/10/24 21:02
 */
public class AdminNotLoginException extends SystemBaseException{

    public AdminNotLoginException() {
        super();
    }

    public AdminNotLoginException(String message) {
        super(message);
    }

    public AdminNotLoginException(String message, Throwable cause) {
        super(message, cause);
    }
}