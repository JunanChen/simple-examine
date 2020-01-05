package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.enums.SystemCode;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.mapper.AdminMapper;
import com.cdtu.simpleexamine.pojo.dbo.AdminRoles;
import com.cdtu.simpleexamine.pojo.dbo.Roles;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AdminVo;
import com.cdtu.simpleexamine.service.AdminRolesService;
import com.cdtu.simpleexamine.service.AdminService;
import com.cdtu.simpleexamine.service.RolesService;
import com.cdtu.simpleexamine.utils.IpUtil;
import com.cdtu.simpleexamine.utils.MD5util;
import com.cdtu.simpleexamine.utils.TimeUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    private RolesService rolesService;

    @Autowired
    private AdminRolesService adminRolesService;

    @Resource(name = "adminMD5Matcher")
    private HashedCredentialsMatcher matcher;

    @Override
    public SystemBaseDto List() {
        List<Admin> admins = adminMapper.selectList(null);
        if(admins != null)
            return new SystemBaseDto(SystemCode.OK.Value(), admins, null);
        else
            return new SystemBaseDto(SystemCode.OPERATION_FAILURE.Value(), "未查询到数据！");
    }

    @Override
    public SystemBaseDto login(AdminVo adminVo, HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        //验证验证码
//        Session session = subject.getSession(true);
//        String identifyCode = (String) session.getAttribute("identifyCode");
//        if(identifyCode == null || !identifyCode.equalsIgnoreCase(adminVo.getIdentifyCode()))
//            return new SystemBaseDto(SystemCode.IDENTIFYCODE_ERROR.Value(), "验证码错误！");

        SystemBaseDto baseDto = new SystemBaseDto();
        //登录
        try {
            subject.login(new UsernamePasswordToken(adminVo.getAdminName(), adminVo.getPassword()));
        } catch (UnknownAccountException e) {
            //账号未找到
            return new SystemBaseDto(SystemCode.ACCOUNT_NOT_EXIST_EXCEPTION.Value(), "用户不存在!" );
        } catch (LockedAccountException e) {
            //账号被锁定
            return new SystemBaseDto(SystemCode.LOCKED_ACCOUNT_EXCEPTION.Value(), "该账号已被禁止登录，请联系管理员！");
        } catch (Exception e) {
            //用户名或密码错误
            return new SystemBaseDto(SystemCode.USERNAME_OR_PASSWORD_ERROR.Value(), "用户名或密码错误！");
        }

        // 向数据库记录最后一次登录的时间
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        admin.setLastLoginTime((int) TimeUtil.getTimeStamp());
        adminMapper.updateById(admin);

        String sessionId = (String) subject.getSession().getId();
        adminVo.setSessionId(sessionId);
        adminVo.setIpAddress(IpUtil.getIpFromRequest(request));
        return SystemBaseDto.getOK(adminVo, null);
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

    @Override
    public SystemBaseDto logOut() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto getAllInfo() {
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        queryWrapper.select("admin_id", "admin_name");
        List<Admin> admins = adminMapper.selectList(queryWrapper);
        return checkList(admins);
    }

    @Override
    public SystemBaseDto changePassword(String oldPassword, String newPassword) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        if(oldPassword != null && MD5util.encryptString(oldPassword, admin.getAdminName()).equals(admin.getAdminPwd())){
            admin.setAdminPwd(MD5util.encryptString(newPassword, admin.getAdminName()));
            int i = adminMapper.updateById(admin);
            if(i > 0) {
                SecurityUtils.getSubject().logout();
                return SystemBaseDto.getOK();
            }
            return SystemBaseDto.getFAIL("密码修改失败！");
        }
        return SystemBaseDto.getFAIL("原密码输入不一致！");
    }

    @Override
    public SystemBaseDto getInfo() {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        AdminVo adminVo = adminToAdminVo(adminMapper.selectByUsername(admin.getAdminName()));
        return SystemBaseDto.getOK(adminVo, null);
    }

    @Override
    public SystemBaseDto updateInfo(AdminVo adminVo) {
        Admin admin = adminVoToAdmin(adminVo);
        int i = adminMapper.updateById(admin);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto page(Integer pageNo, Integer pageSize, String search) {
        Page<Admin> page = new Page<>(pageNo, pageSize);
        QueryWrapper<Admin> queryWrapper = new QueryWrapper<>();
        if (search != null && !search.isEmpty()) {
            queryWrapper.eq("admin_name", search);
        }
        IPage<Admin> adminIPage = adminMapper.selectByPage(page, queryWrapper);
        return SystemBaseDto.getOK(adminIPage, null);
    }

    @Override
    public SystemBaseDto save(Admin admin) {
        admin.setSalt(MD5util.getRandomSalt());
        admin.setAdminPwd(MD5util.encryptString(admin.getAdminPwd(), admin.getSalt()));
        int insert = adminMapper.insert(admin);
        List<Integer> roles = admin.getRoles();
        if (roles != null && roles.size() > 0) {
            QueryWrapper<AdminRoles> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("admin_id", admin.getAdminId());
            adminRolesService.deleteByWrapper(queryWrapper);
            for (Integer role : roles) {
                AdminRoles adminRoles = new AdminRoles();
                adminRoles.setAdminId(admin.getAdminId());
                adminRoles.setRoleId(role);
                adminRolesService.save(adminRoles);
            }
        }
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto update(Admin admin) {
        admin.setAdminPwd(null);
        admin.setSalt(null);
        List<Integer> roles = admin.getRoles();
        if (roles != null && roles.size() > 0) {
            QueryWrapper<AdminRoles> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("admin_id", admin.getAdminId());
            adminRolesService.deleteByWrapper(queryWrapper);
            for (Integer role : roles) {
                AdminRoles adminRoles = new AdminRoles();
                adminRoles.setAdminId(admin.getAdminId());
                adminRoles.setRoleId(role);
                adminRolesService.save(adminRoles);
            }
        }
        return updateById(admin);
    }

    @Override
    public SystemBaseDto deleteById(String adminId) {
        int delete = adminMapper.deleteById(adminId);
        return checkUpdate(delete);
    }

    private SystemBaseDto checkUpdate(int i) {
        if(i > 0)
            return SystemBaseDto.getOK();
        else
            return SystemBaseDto.getFAIL();
    }

    public AdminVo adminToAdminVo(Admin admin) {
        AdminVo adminVo = new AdminVo();
        BeanUtils.copyProperties(admin, adminVo);
        adminVo.setLastLoginTime(TimeUtil.timeStampToDate(String.valueOf(admin.getLastLoginTime()), null));
        adminVo.setBirthday(TimeUtil.timeStampToSimpleDate(String.valueOf(admin.getBirthday()), null));
        List<Roles> roles = rolesService.getByAdminId(admin.getAdminId());
        adminVo.setRole(String.valueOf(roles != null && roles.size() > 0 ? roles.iterator().next().getRoleName() : null));
        return adminVo;
    }

    public Admin adminVoToAdmin(AdminVo adminVo) {
        Admin admin = new Admin();
        BeanUtils.copyProperties(adminVo, admin);
        admin.setBirthday(TimeUtil.dateToStampWithSimple(String.valueOf(adminVo.getBirthday())));
        return admin;
    }

    private SystemBaseDto checkList(List list) {
        if(list != null && list.size() > 0)
            return SystemBaseDto.getOK(list, null);
        return SystemBaseDto.getDataNull();
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
