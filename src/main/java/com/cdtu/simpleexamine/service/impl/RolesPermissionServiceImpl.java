package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cdtu.simpleexamine.pojo.dbo.RolesPermission;
import com.cdtu.simpleexamine.mapper.RolesPermissionMapper;
import com.cdtu.simpleexamine.service.RolesPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Service
public class RolesPermissionServiceImpl extends ServiceImpl<RolesPermissionMapper, RolesPermission> implements RolesPermissionService {

    @Autowired
    private RolesPermissionMapper rolesPermissionMapper;

    @Override
    public void deleteByRolesId(Integer roleId) {
        QueryWrapper<RolesPermission> queryWrapper = new QueryWrapper<>();
        if (roleId != null) {
            queryWrapper.eq("role_id", roleId);
        }
        rolesPermissionMapper.delete(queryWrapper);
    }
}
