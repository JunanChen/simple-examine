package com.cdtu.simpleexamine.web.controller;

import com.cdtu.simpleexamine.pojo.dbo.PatrolItem;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PatrolVo;
import com.cdtu.simpleexamine.service.PatrolItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author junan
 * @since 2019-10-21
 */
@RestController
@RequestMapping("/patrolItem")
@Api(description = "PatrolItem 接口")
public class PatrolItemController {

    @Autowired
    private PatrolItemService patrolItemService;

    @GetMapping("/all/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto all(@PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return patrolItemService.all(pageNow, pageSize);
    }

    @PostMapping("/save/batch")
    @ApiOperation(value = "批量插入数据", notes = "可用于批量导入数据")
    public SystemBaseDto saveBatch(@RequestBody List<PatrolItem> patrolItems) {
        return patrolItemService.saveList(patrolItems);
    }

    @PostMapping("/save")
    @ApiOperation(value = "插入一条数据")
    public SystemBaseDto save(@RequestBody PatrolItem patrolItem) {
        return patrolItemService.savePatrolItem(patrolItem);
    }

    @PostMapping("/delete/{patrolItemId}")
    @ApiOperation(value = "删除一条数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@PathVariable String patrolItemId) {
        return patrolItemService.delete(patrolItemId);
    }

    @PostMapping("/delete")
    @ApiOperation(value = "批量删除数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@RequestBody List<String> patrolItemIds) {
        return patrolItemService.batchDelete(patrolItemIds);
    }

    @PostMapping("/update")
    @ApiOperation(value = "通过id更新一条数据")
    public SystemBaseDto update(@RequestBody PatrolItem patrolItem) {
        return patrolItemService.update(patrolItem);
    }

}
