package com.cdtu.simpleexamine.service.impl;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.mapper.PermissionMapper;
import com.cdtu.simpleexamine.service.PermissionService;
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
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permission> getByAdminId(String adminId) {
        return permissionMapper.selectListByAdminId(adminId);
    }

    @Override
    public List<Permission> getByRoleId(Integer roleId) {
        return permissionMapper.selectListByRoleId(roleId);
    }
}
