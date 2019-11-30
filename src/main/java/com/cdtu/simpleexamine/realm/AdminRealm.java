package com.cdtu.simpleexamine.realm;

import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.pojo.dbo.Roles;
import com.cdtu.simpleexamine.service.AdminService;
import com.cdtu.simpleexamine.service.PermissionService;
import com.cdtu.simpleexamine.service.RolesService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


/**
 * 自定义的realm
 */
public class AdminRealm extends AuthorizingRealm {

    Logger logger = LoggerFactory.getLogger(AdminRealm.class);

    public AdminRealm() {
        //更改匹配器为md5加密匹配器
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("md5");// 散列算法:这里使用MD5算法;
        hashedCredentialsMatcher.setHashIterations(3);// 散列的次数，比如散列两次，相当于md5(md5(""));
        this.setCredentialsMatcher(hashedCredentialsMatcher);
    }

    @Autowired
    private AdminService adminService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RolesService rolesService;

    /**
     * 执行授权逻辑
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        Admin admin = (Admin) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        //加载角色
        List<Roles> rolesList = rolesService.getByAdminId(admin.getAdminId());
        for (Roles roles : rolesList) {
            info.addRole(roles.getRoleName());
        }
        //加载权限
        List<Permission> permissionList = permissionService.getByAdminId(admin.getAdminId());
        if (permissionList != null && permissionList.size() > 0) {
            for (Permission permission : permissionList)
                //将权限资源添加到用户信息中
                info.addStringPermission(permission.getPermissionName());
        }
        return info;
    }

    /**
     * 执行认证逻辑
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) authenticationToken;
        Admin admin = adminService.getByUsername(usernamePasswordToken.getUsername());
        if (admin == null)
            throw new UnknownAccountException();
        if (admin.getAdminStatu().intValue() != 0)
            throw new LockedAccountException("this admin is banned from login in!");
        //设置盐，用管理员名来做盐
        SimpleAuthenticationInfo simpleAuthenticationInfo =
                new SimpleAuthenticationInfo(admin, admin.getAdminPwd(), ByteSource.Util.bytes(admin.getSalt()), getName());
        return simpleAuthenticationInfo;
    }

}
