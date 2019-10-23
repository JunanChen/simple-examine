package com.cdtu.simpleexamine.exception;

/**
 * @author junan
 * @version V1.0
 * @className BatchDeleteException
 * @disc
 * @date 2019/10/19 17:54
 */
public class BatchDeleteException extends SystemBaseException{
    public BatchDeleteException() {
        super();
    }

    public BatchDeleteException(String message) {
        super(message);
    }

    public BatchDeleteException(String message, Throwable cause) {
        super(message, cause);
    }
}