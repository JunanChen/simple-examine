package com.cdtu.simpleexamine.web.controller;


import com.cdtu.simpleexamine.pojo.dbo.Patrol;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PatrolVo;
import com.cdtu.simpleexamine.service.PatrolService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author junan
 * @since 2019-10-19
 */
@RestController
@RequestMapping("/patrol")
@Api(description = "巡检数据接口")
public class PatrolController {

    @Autowired
    private PatrolService patrolService;

    @Deprecated
    @GetMapping("/all")
    @ApiOperation(value = "获取全部数据")
    public SystemBaseDto all(){
        return patrolService.all();
    }

    @GetMapping("/all/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto all(@PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return patrolService.all(pageNow, pageSize);
    }

    @GetMapping("/search/{search}/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto allBySearch(@PathVariable String search, @PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return patrolService.allBySearch(search, pageNow, pageSize);
    }

    @PostMapping("/save/batch")
    @ApiOperation(value = "批量插入数据", notes = "可用于批量导入数据")
    public SystemBaseDto saveBatch(@RequestBody List<Patrol> patrols) {
        return patrolService.saveList(patrols);
    }

    @PostMapping("/save")
    @ApiOperation(value = "插入一条数据")
    public SystemBaseDto save(@RequestBody PatrolVo patrolVo) {
        return patrolService.savePatrol(patrolVo);
    }

    @PostMapping("/delete/{patrolId}")
    @ApiOperation(value = "删除一条数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@PathVariable String patrolId) {
        return patrolService.delete(patrolId);
    }

    @PostMapping("/delete")
    @ApiOperation(value = "批量删除数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@RequestBody List<String> patrolIds) {
        return patrolService.batchDelete(patrolIds);
    }

    @PostMapping("/update")
    @ApiOperation(value = "通过id更新一条数据")
    public SystemBaseDto update(@RequestBody PatrolVo patrolVo) {
        return patrolService.update(patrolVo);
    }

}
