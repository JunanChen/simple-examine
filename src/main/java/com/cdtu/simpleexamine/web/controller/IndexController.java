package com.cdtu.simpleexamine.web.controller;

import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author junan
 * @version V1.0
 * @className IndexController
 * @disc
 * @date 2020/1/6 16:17
 */
@RestController
@RequestMapping("/index")
@Api
public class IndexController {

    @Autowired
    private PatrolService patrolService;

    @Autowired
    private EquFailService equFailService;

    @Autowired
    private StaffService staffService;

    @Autowired
    private EquService equService;

    @Autowired
    private TaskService taskService;

    @GetMapping("/header/data")
    @ApiOperation("获取首页header部分的数据")
    public SystemBaseDto getHeaderData() {

        Map<String, Long> map = new HashMap<>();

        // 获取今日需要巡检的任务数目
        Long needNums = taskService.getNumsByToday();
        map.put("needNums", needNums);

        // 获取今日已经巡检的数据
        Long workedNums = taskService.getNumsByTodayWorked();
        map.put("workedNums", workedNums);

        // 今日设备故障
        Long failedNums = equFailService.getNumsByToDay();
        map.put("failedNums", failedNums);

        // 全部巡检人员
        Long staffNums = staffService.getNums();
        map.put("staffNums", staffNums);

        // 设备总数
        Long equNums = equService.getNums();
        map.put("equNums", equNums);

        // 全部巡检记录
        Long patrolNums = patrolService.getNums();
        map.put("patrolNums", patrolNums);

        return SystemBaseDto.getOK(map, null);
    }
}