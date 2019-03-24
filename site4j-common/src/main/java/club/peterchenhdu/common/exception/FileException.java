/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.exception;

/**
 * FileException
 *
 * @author PiChen
 * @since 2018/10/20 23:03
 */
public class FileException extends BaseRuntimeException {

    public FileException() {
        super();
    }


    public FileException(String message) {
        super(message);
    }


    public FileException(String message, Throwable cause) {
        super(message, cause);
    }
}
