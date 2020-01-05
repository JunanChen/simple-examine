package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.pojo.dbo.Module;
import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.mapper.PermissionMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.ModuleService;
import com.cdtu.simpleexamine.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Autowired
    private ModuleService moduleService;

    @Override
    public List<Permission> getByAdminId(String adminId) {
        return permissionMapper.selectListByAdminId(adminId);
    }

    @Override
    public List<Permission> getByRoleId(Integer roleId) {
        return permissionMapper.selectListByRoleId(roleId);
    }

    @Override
    public SystemBaseDto page(Integer pageNo, Integer pageSize, String search) {
        Page<Permission> page = new Page<>(pageNo, pageSize);
        QueryWrapper<Permission> queryWrapper = new QueryWrapper<>();
        if (search != null && !search.isEmpty()) {
            queryWrapper.eq("permission_name", search);
        }
        IPage<Permission> permissionIPage = permissionMapper.selectByPage(page, queryWrapper);
        return SystemBaseDto.getOK(permissionIPage, null);
    }

    @Override
    public SystemBaseDto allTree() {
        List<Permission> permissions = permissionMapper.selectList(null);
        SystemBaseDto all = moduleService.all();
        List<Module> modules = (List<Module>) all.getData();
        for (Module module : modules) {
            if (module.getChildrens() != null) {
                for (Module children : module.getChildrens()) {
                    for (Permission permission : permissions) {
                        if (permission.getPermissionModule() != null && permission.getPermissionModule().equals(children.getModuleId())) {
                            if (children.getPermissions() == null)
                                children.setPermissions(new ArrayList<>());
                            children.getPermissions().add(permission);
                        }
                    }
                }
            }
        }
        return all;
    }
}
