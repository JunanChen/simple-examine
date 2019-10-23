package com.cdtu.simpleexamine.web.controller;


import com.cdtu.simpleexamine.pojo.dbo.Point;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PointVo;
import com.cdtu.simpleexamine.service.PointService;
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
 * @since 2019-10-22
 */
@RestController
@RequestMapping("/point")
public class PointController {

    @Autowired
    private PointService pointService;

    @GetMapping("/all")
    @ApiOperation(value = "获取全部数据")
    public SystemBaseDto all() {
        return pointService.all();
    }

    @GetMapping("/all/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto all(@PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return pointService.all(pageNow, pageSize);
    }

    @GetMapping("/search/{search}/{pageNow}/{pageSize}")
    @ApiOperation(value = "分页获取全部数据")
    public SystemBaseDto allBySearch(@PathVariable String search, @PathVariable Integer pageNow, @PathVariable Integer pageSize){
        return pointService.allBySearch(search, pageNow, pageSize);
    }

    @PostMapping("/save/batch")
    @ApiOperation(value = "批量插入数据", notes = "可用于批量导入数据")
    public SystemBaseDto saveBatch(@RequestBody List<Point> points) {
        return pointService.saveList(points);
    }

    @PostMapping("/save")
    @ApiOperation(value = "插入一条数据")
    public SystemBaseDto save(@RequestBody PointVo pointVo) {
        return pointService.savePoint(pointVo);
    }

    @PostMapping("/delete/{pointId}")
    @ApiOperation(value = "删除一条数据", notes = "需要dba角色")
//    @RequiresRoles("dba")
    public SystemBaseDto delete(@PathVariable String pointId) {
        return pointService.delete(pointId);
    }

    @PostMapping("/delete")
    @ApiOperation(value = "批量删除数据", notes = "需要dba角色")
    @RequiresRoles("dba")
    public SystemBaseDto delete(@RequestBody List<String> pointIds) {
        return pointService.batchDelete(pointIds);
    }

    @PostMapping("/update")
    @ApiOperation(value = "通过id更新一条数据")
    public SystemBaseDto update(@RequestBody PointVo pointVo) {
        return pointService.update(pointVo);
    }
    
}
