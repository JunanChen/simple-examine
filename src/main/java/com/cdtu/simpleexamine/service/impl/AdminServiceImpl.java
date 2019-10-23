package com.cdtu.simpleexamine.service.impl;

import com.cdtu.simpleexamine.enums.SystemCode;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.mapper.AdminMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AdminVo;
import com.cdtu.simpleexamine.service.AdminService;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public SystemBaseDto List() {
        List<Admin> admins = adminMapper.selectList(null);
        if(admins != null)
            return new SystemBaseDto(SystemCode.OK.Value(), admins, null);
        else
            return new SystemBaseDto(SystemCode.OPERATION_FAILURE.Value(), "未查询到数据！");
    }

    @Override
    public SystemBaseDto login(AdminVo adminVo) {
        Subject subject = SecurityUtils.getSubject();
        //验证验证码
//        Session session = subject.getSession(true);
//        String identifyCode = (String) session.getAttribute("identifyCode");
//        if(identifyCode == null || !identifyCode.equalsIgnoreCase(adminVo.getIdentifyCode()))
//            return new SystemBaseDto(SystemCode.IDENTIFYCODE_ERROR.Value(), "验证码错误！");

        SystemBaseDto baseDto = new SystemBaseDto();
        //登录
        try {
            subject.login(new UsernamePasswordToken(adminVo.getUsername(), adminVo.getPassword()));
        } catch (UnknownAccountException e) {
            //账号未找到
            return new SystemBaseDto(SystemCode.ACCOUNT_NOT_EXIST_EXCEPTION.Value(), "用户不存在！错误代码：" + baseDto.getCode());
        } catch (LockedAccountException e) {
            //账号被锁定
            return new SystemBaseDto(SystemCode.LOCKED_ACCOUNT_EXCEPTION.Value(), "该账号已被禁止登录，请联系管理员！错误代码：" + baseDto.getCode());
        } catch (Exception e) {
            //用户名或密码错误
            return new SystemBaseDto(SystemCode.USERNAME_OR_PASSWORD_ERROR.Value(), "用户名或密码错误！错误代码：" + baseDto.getCode());
        }
        return new SystemBaseDto(SystemCode.OK.Value());
    }

    @Override
    public Admin getByUsername(String username) {
        return adminMapper.selectByUsername(username);
    }

    @Override
    public SystemBaseDto disable(String adminId) {
        Admin admin = new Admin();
        admin.setAdminId(adminId);
        admin.setAdminStatu(1);
        return updateById(admin);
    }

    @Override
    public SystemBaseDto enable(String adminId) {
        Admin admin = new Admin();
        admin.setAdminId(adminId);
        admin.setAdminStatu(0);
        return updateById(admin);
    }


    /**
     * 更新ById通用
     * @param admin
     * @return
     */
    private SystemBaseDto updateById(Admin admin) {
        int update = adminMapper.updateById(admin);
        if(update > 0) {
            return SystemBaseDto.getOK();
        } else {
            return SystemBaseDto.getFAIL();
        }
    }
}
