package com.cdtu.simpleexamine.resolver;

import com.cdtu.simpleexamine.enums.SystemCode;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.utils.FastJsonUtil;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * <p>
 *      springmvc 异常处理
 * </p>
 *
 * @author junan
 * @version 1.0.0
 * @since 19-5-21
 */
//@Component
@Deprecated
public class ShiroExceptionResolver implements HandlerExceptionResolver {

    /**
     * shiro无权限时跳转
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @return
     */
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        System.out.println(e + "sjdfkjhsdajkif");
        if (httpServletRequest.getMethod().equals("GET")) {
            if (e instanceof UnauthorizedException) {
                ModelAndView mv = new ModelAndView("/403");
                return mv;
            }
        } else if (httpServletRequest.getMethod().equals("POST")) {
            httpServletResponse.setContentType("application/json;charset=UTF-8");
            httpServletResponse.setCharacterEncoding("UTF-8");
            SystemBaseDto baseDto = new SystemBaseDto();
            baseDto.setCode(SystemCode.UNAUTHORIZED.Value());
            baseDto.setMessage("你没有权限执行该操作！错误代码：" + baseDto.getCode());
            try {
                httpServletResponse.getWriter().print(FastJsonUtil.toJSONString(baseDto));
                httpServletResponse.getWriter().flush();
                httpServletResponse.getWriter().close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
}
