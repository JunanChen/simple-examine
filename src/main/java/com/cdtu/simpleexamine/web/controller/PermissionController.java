package com.cdtu.simpleexamine.web.controller;

import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.PermissionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author junan
 * @version V1.0
 * @className PermissionController
 * @disc
 * @date 2019/12/1 15:53
 */
@RestController
@Api("权限接口")
@RequestMapping("/permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @GetMapping("/{pageNo}/{pageSize}")
    @ApiOperation(value = "分页查询权限")
    public SystemBaseDto page(@PathVariable Integer pageNo, @PathVariable Integer pageSize) {
        return permissionService.page(pageNo, pageSize, null);
    }

    @GetMapping("/{pageNo}/{pageSize}/{search}")
    @ApiOperation(value = "搜索分页查询权限")
    public SystemBaseDto page(@PathVariable Integer pageNo, @PathVariable Integer pageSize, @PathVariable String search) {
        return permissionService.page(pageNo, pageSize, search);
    }

    @GetMapping("/all/tree")
    @ApiOperation(value = "获取全部权限，以 tree 显示")
    public SystemBaseDto allTree() {
        return permissionService.allTree();
    }

}