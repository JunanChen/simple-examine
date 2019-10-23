package com.cdtu.simpleexamine.resolver;

import com.cdtu.simpleexamine.enums.SystemCode;
import com.cdtu.simpleexamine.exception.SystemBaseException;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author junan
 * @version V1.0
 * @className GlobalExceptionHandler
 * @disc    全局异常处理
 * @date 2019/10/15 15:53
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 日志打印
     * @return
     */
    private Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 处理系统自定义异常
     * @param e
     * @return
     */
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public SystemBaseDto doHandleRuntimeException(SystemBaseException e){
        /**
         * 封装异常信息
         */
        log.warn("出现系统自定义异常，原因如下：" + e.getMessage());
        return new SystemBaseDto(SystemCode.OPERATION_FAILURE.Value());
    }

    /**
     * 处理 shiro 异常
     * @param e
     * @return
     */
    @ExceptionHandler(ShiroException.class)
    @ResponseBody
    public SystemBaseDto doHandleShiroException(ShiroException e){
        SystemBaseDto result = new SystemBaseDto();
        result.setCode(SystemCode.OPERATION_FAILURE.Value());
        if(e instanceof IncorrectCredentialsException) {
            result.setMessage("密码不正确");
            log.warn("出现 shiro 异常，原因如下：user login but password error!");
        }
        else if(e instanceof UnknownAccountException) {
            result.setMessage("此账户不存在");
            log.warn("出现 shiro 异常，原因如下：user login but account not found!");
        }
        else if(e instanceof LockedAccountException) {
            result.setMessage("账户已被禁用");
            log.warn("出现 shiro 异常，原因如下：user login but account locked!");
        }
        else if(e instanceof UnauthorizedException || e instanceof UnauthenticatedException) {
            result.setMessage("对不起，您没有操作权限！");
            log.warn("出现 shiro 异常，原因如下：user not have a permission to operation!");
        } else {
            result.setMessage("服务器未知异常！");
            log.warn("出现 shiro 异常，原因如下：" + e.getMessage());
        }
        return result;
    }

    /**
     * 处理其他异常
     * @param e
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public SystemBaseDto doHandleException(Exception e){

        /**
         * shiro未放行的URL访问异常
         */
        if(e instanceof HttpRequestMethodNotSupportedException) {
            log.error("shiro 未放行的URL");
            return new SystemBaseDto(SystemCode.FORBIDDEN.Value(), "用户未登录，无法访问！");
        } else {
            log.error("出现未知异常，原因如下：" + e.getMessage());
            return new SystemBaseDto(SystemCode.SYSTEM_UNKNOW_EXCEPTION.Value(), "系统出现未知异常！");
        }
    }
}