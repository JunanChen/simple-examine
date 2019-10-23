package com.cdtu.simpleexamine.web.controller;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.RolesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author junan
 * @version V1.0
 * @className RolesController
 * @disc
 * @date 2019/10/17 22:29
 */
@RestController
@Api(description = "角色相关接口")
@RequestMapping("/roles")
public class RolesController {

    @Autowired
    private RolesService rolesService;

    @GetMapping("/all")
    @ApiOperation(value = "获取所有的角色信息", notes = "需要system:roles:select权限")
    @RequiresPermissions("system:roles:select")
    public SystemBaseDto getAll() {
        return rolesService.getAll();
    }

    @GetMapping("/permissions/{roleId}")
    @ApiOperation(value = "获取角色的所拥有的权限信息", notes = "需要system:roles:select权限")
    @RequiresPermissions("system:roles:select")
    public SystemBaseDto getPermissions(@PathVariable Integer roleId) {
        return rolesService.getPermissions(roleId);
    }

    @GetMapping("/permissions/add/{roleId}")
    @ApiOperation(value = "为角色添加权限", notes = "需要dba权限")
    @RequiresRoles("dba")
    public SystemBaseDto addPermissions(@PathVariable Integer roleId, List<Permission> permissions) {
        return rolesService.addPermissions(roleId, permissions);
    }

    @PostMapping("/disable/{roleId}")
    @ApiOperation(value = "禁用角色", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto disable(@PathVariable Integer roleId) {
        return rolesService.disable(roleId);
    }

    @PostMapping("/enable/{roleId}")
    @ApiOperation(value = "启用角色", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto enable(@PathVariable Integer roleId) {
        return rolesService.enable(roleId);
    }

}