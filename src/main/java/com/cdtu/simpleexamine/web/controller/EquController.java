package com.cdtu.simpleexamine.web.controller;


import com.cdtu.simpleexamine.pojo.dbo.Equ;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.EquVo;
import com.cdtu.simpleexamine.service.EquService;
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
 * @since 2019-10-22
 */
@RestController
@RequestMapping("/equ")
public class EquController {

    @Autowired
    private EquService equService;

    @Deprecated
    @GetMapping("/all")
    @ApiOperation(value = "获取全部数据")
    public SystemBaseDto all() {
        return equService.all();
    }

    @GetMapping("/all/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto all(@PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return equService.all(pageNow, pageSize);
    }

    @GetMapping("/search/{search}/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto allBySearch(@PathVariable String search, @PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return equService.allBySearch(search, pageNow, pageSize);
    }

    @PostMapping("/save/batch")
    @ApiOperation(value = "批量插入数据", notes = "可用于批量导入数据")
    public SystemBaseDto saveBatch(@RequestBody List<Equ> equs) {
        return equService.saveList(equs);
    }

    @PostMapping("/save")
    @ApiOperation(value = "插入一条数据")
    public SystemBaseDto save(@RequestBody EquVo equVo) {
        return equService.saveEqu(equVo);
    }

    @PostMapping("/delete/{equId}")
    @ApiOperation(value = "删除一条数据", notes = "需要dba角色")
//    @RequiresRoles("dba")
    public SystemBaseDto delete(@PathVariable String equId) {
        return equService.delete(equId);
    }

    @PostMapping("/delete")
    @ApiOperation(value = "批量删除数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@RequestBody List<String> equIds) {
        return equService.batchDelete(equIds);
    }

    @PostMapping("/update")
    @ApiOperation(value = "通过id更新一条数据")
    public SystemBaseDto update(@RequestBody EquVo equVo) {
        return equService.update(equVo);
    }

}
