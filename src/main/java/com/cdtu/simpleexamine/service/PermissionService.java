package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *      权限服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
public interface PermissionService {

    List<Permission> getByAdminId(String adminId);

    List<Permission> getByRoleId(Integer roleId);

}
