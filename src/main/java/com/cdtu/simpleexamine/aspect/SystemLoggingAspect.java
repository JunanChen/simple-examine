package com.cdtu.simpleexamine.aspect;

import com.cdtu.simpleexamine.enums.SystemCode;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Log;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.LogService;
import com.cdtu.simpleexamine.utils.IpUtil;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/**
 * <p>
 * 系统日志切面，查出ip，响应时间等数据在数据库记录
 * </p>
 *
 * @author junan
 * @version 1.0.0
 * @since 19-6-8
 */
@Aspect
@Component
@SuppressWarnings("all")
public class SystemLoggingAspect {

    private Logger logger = LoggerFactory.getLogger(SystemLoggingAspect.class);

    @Autowired
    private LogService logService;

    @Pointcut("execution(public * com.cdtu.simpleexamine.web.controller.*.* (..))")
    private void pointCut() {
    }

    /**
     * 该环绕通知获取请求ip和计算响应时间，并记录到数据库
     */
    @Around("pointCut()")
    public Object aroundByString(ProceedingJoinPoint joinPoint) {
        Long startTime = System.currentTimeMillis();      //记录开始时间
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        final Admin admin = ((Admin) SecurityUtils.getSubject().getPrincipal());
        Log log = new Log();
        //获取ip
        log.setLogIp(String.valueOf(IpUtil.getIpFromRequest(request)));
        log.setLogAdmin(admin != null ? admin.getAdminId() : null);
        log.setLogTime((int) TimeUtil.getTimeStamp());
        log.setLogMethod("GET".equals(request.getMethod()) ? 0 : 1);
        log.setLogDesc(getMethodValueFromAnnotation("value", getMethodAnnotation(joinPoint, ApiOperation.class)));
        log.setLogUrl(String.valueOf(request.getRequestURL()));
        Object proceed = null;
        try {
            proceed = joinPoint.proceed();
            //后置
            log.setLogStat(0);
            if (proceed instanceof SystemBaseDto) {
                SystemBaseDto baseDto = (SystemBaseDto) proceed;
                if (baseDto.getCode().intValue() != SystemCode.OK.Value().intValue())
                    log.setLogStat(1);
            }
            log.setLogUsetime((int) (System.currentTimeMillis() - startTime));
            return proceed;
        } catch (Throwable throwable) {
            logger.error(throwable.getClass().getName() + "  " + throwable.getMessage());
            log.setLogUsetime((int) (System.currentTimeMillis() - startTime));
            log.setLogStat(1);
        } finally {
            //数据库登陆后操作日志记录
            log.setLogId(UUIDUtil.get32UUID());
            logService.save(log);
        }
        return null;
    }

    //获取切入点的方法注解
    private <T extends Annotation> T getMethodAnnotation(ProceedingJoinPoint joinPoint, Class<T> clazz) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        return method.getAnnotation(clazz);
    }


    //获取注解的方法值
    private String getMethodValueFromAnnotation(String methodName, Annotation annotation) {
        if (annotation == null) {
            return null;
        }
        try {
            Class<?> clazz = annotation.annotationType();
            Method m = clazz.getDeclaredMethod(methodName);
            return m.invoke(annotation).toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
