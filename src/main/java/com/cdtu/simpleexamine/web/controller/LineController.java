package com.cdtu.simpleexamine.web.controller;


import com.cdtu.simpleexamine.pojo.dbo.Line;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.LineVo;
import com.cdtu.simpleexamine.service.LineService;
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
@RequestMapping("/line")
public class LineController {

    @Autowired
    private LineService lineService;

    @GetMapping("/all")
    @ApiOperation(value = "获取全部数据")
    public SystemBaseDto all() {
        return lineService.all();
    }

    @GetMapping("/all/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto all(@PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return lineService.all(pageNow, pageSize);
    }

    @GetMapping("/search/{search}/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto allBySearch(@PathVariable String search, @PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return lineService.allBySearch(search, pageNow, pageSize);
    }

    @PostMapping("/save/batch")
    @ApiOperation(value = "批量插入数据", notes = "可用于批量导入数据")
    public SystemBaseDto saveBatch(@RequestBody List<Line> lines) {
        return lineService.saveList(lines);
    }

    @PostMapping("/save")
    @ApiOperation(value = "插入一条数据")
    public SystemBaseDto save(@RequestBody LineVo lineVo) {
        return lineService.saveLine(lineVo);
    }

    @PostMapping("/delete/{lineId}")
    @ApiOperation(value = "删除一条数据", notes = "需要dba角色")
//    @RequiresRoles("dba")
    public SystemBaseDto delete(@PathVariable String lineId) {
        return lineService.delete(lineId);
    }

    @PostMapping("/delete")
    @ApiOperation(value = "批量删除数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@RequestBody List<String> lineIds) {
        return lineService.batchDelete(lineIds);
    }

    @PostMapping("/update")
    @ApiOperation(value = "通过id更新一条数据")
    public SystemBaseDto update(@RequestBody LineVo lineVo) {
        return lineService.update(lineVo);
    }
    
}
