package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.pojo.dbo.Roles;
import com.cdtu.simpleexamine.mapper.RolesMapper;
import com.cdtu.simpleexamine.pojo.dbo.RolesPermission;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.PermissionService;
import com.cdtu.simpleexamine.service.RolesPermissionService;
import com.cdtu.simpleexamine.service.RolesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.TimeUtil;
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
public class RolesServiceImpl extends ServiceImpl<RolesMapper, Roles> implements RolesService {

    @Autowired
    private RolesMapper rolesMapper;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RolesPermissionService rolesPermissionService;

    @Override
    public List<Roles> getByAdminId(String adminId) {
        return rolesMapper.selectListByAdminId(adminId);
    }

    @Override
    public SystemBaseDto getAll() {
        List<Roles> rolesList = rolesMapper.selectList(null);
        return getList(rolesList);
    }

    @Override
    public SystemBaseDto getPermissions(Integer roleId) {
        List<Permission> permissions = permissionService.getByRoleId(roleId);
        return getList(permissions);
    }

    @Override
    public SystemBaseDto disable(Integer roleId) {
        Roles roles = new Roles();
        roles.setRoleId(roleId);
        roles.setRoleStatu(1);
        return update(roles);
    }

    @Override
    public SystemBaseDto enable(Integer roleId) {
        Roles roles = new Roles();
        roles.setRoleId(roleId);
        roles.setRoleStatu(0);
        return update(roles);
    }

    @Override
    public SystemBaseDto addPermissions(Integer roleId, List<Permission> permissions) {
        for (Permission permission : permissions) {
            RolesPermission rolesPermission = new RolesPermission();
            rolesPermission.setRoleId(roleId);
            rolesPermission.setPermissionId(permission.getPermissionId());
            rolesPermissionService.save(rolesPermission);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto search(Integer pageNo, Integer pageSize, String search) {
        Page<Roles> page = new Page<>(pageNo, pageSize);
        QueryWrapper<Roles> queryWrapper = new QueryWrapper<>();
        if (search != null && !search.isEmpty()) {
            queryWrapper.eq("role_name", search);
        }
        queryWrapper.orderByAsc("role_order");
        IPage<Roles> page1 = rolesMapper.selectByPage(page, queryWrapper);
        return SystemBaseDto.getOK(page1, null);
    }

    public SystemBaseDto update(Roles roles) {
        roles.setUpdateTime((int) TimeUtil.getTimeStamp());
        rolesMapper.updateById(roles);
        List<Integer> permissions = roles.getPermissions();

        rolesPermissionService.deleteByRolesId(roles.getRoleId());

        for (Integer permission : permissions) {
            RolesPermission rolesPermission = new RolesPermission();
            rolesPermission.setPermissionId(permission);
            rolesPermission.setRoleId(roles.getRoleId());
            rolesPermissionService.save(rolesPermission);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto deleteById(Integer roleId) {
        rolesMapper.deleteById(roleId);
        return SystemBaseDto.getOK();
    }

    private SystemBaseDto getList(List list) {
        if(list != null && list.size() > 0) {
            return SystemBaseDto.getOK(list, null);
        } else {
            return SystemBaseDto.getDataNull();
        }
    }
}
