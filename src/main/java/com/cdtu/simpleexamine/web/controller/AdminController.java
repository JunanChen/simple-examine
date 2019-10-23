package com.cdtu.simpleexamine.web.controller;


import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AdminVo;
import com.cdtu.simpleexamine.pojo.vo.User;
import com.cdtu.simpleexamine.service.AdminService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@RestController
@RequestMapping("/admin")
@Api(description = "管理员相关操作接口")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/all")
    @ApiOperation(value = "查询全部管理员信息", notes = "需要system:admin:select权限")
    @RequiresPermissions("system:admin:select")
    public SystemBaseDto all() {
        return adminService.List();
    }

    @PostMapping("/login")
    @ApiOperation(value = "登录", notes = "登录接口")
    public SystemBaseDto login(AdminVo adminVo) {
        return adminService.login(adminVo);
    }

    @PostMapping("/info/get")
    @ApiOperation(value = "获取当前登录的admin基本信息")
    public SystemBaseDto get() {
        return SystemBaseDto.getOK(new User(), null);
    }

    @PostMapping("/disable/{adminId}")
    @ApiOperation(value = "禁用admin", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto disable(@PathVariable String adminId) {
        return adminService.disable(adminId);
    }

    @PostMapping("/enable/{adminId}")
    @ApiOperation(value = "启用admin", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto enable(@PathVariable String adminId) {
        return adminService.enable(adminId);
    }
}
