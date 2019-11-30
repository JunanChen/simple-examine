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

import javax.servlet.http.HttpServletRequest;

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
    public SystemBaseDto login(@RequestBody AdminVo adminVo, HttpServletRequest request) {
        return adminService.login(adminVo, request);
    }

    @PostMapping("/logOut")
    @ApiOperation(value = "退出登录", notes = "退出登录接口")
    public SystemBaseDto logOut() {
        return adminService.logOut();
    }

    @GetMapping("/info")
    @ApiOperation(value = "获取当前登录的admin基本信息")
    public SystemBaseDto get() {
        return adminService.getInfo();
    }

    @PostMapping("/info/update")
    @ApiOperation(value = "更新当前登录的admin基本信息")
    public SystemBaseDto update(@RequestBody AdminVo adminVo) {
        return adminService.updateInfo(adminVo);
    }

    @GetMapping("/info/all")
    @ApiOperation(value = "获取全部admin基本信息")
    public SystemBaseDto getAdmins() {
        return adminService.getAllInfo();
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

    @PostMapping("/changePassword")
    @ApiOperation(value = "修改密码")
    public SystemBaseDto changePassword(@RequestParam String oldPassword,@RequestParam String newPassword) {
        return adminService.changePassword(oldPassword, newPassword);
    }

}
