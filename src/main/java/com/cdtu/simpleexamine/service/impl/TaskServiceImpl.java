package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Task;
import com.cdtu.simpleexamine.mapper.TaskMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.TaskVo;
import com.cdtu.simpleexamine.service.TaskService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
@Service
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task> implements TaskService {


    @Autowired
    private TaskMapper taskMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<TaskVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = taskMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Task> patrols = taskMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(taskToTaskVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<TaskVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Task> queryWrapper = new QueryWrapper();
        queryWrapper.eq("task_id", search);

        Integer integer = taskMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Task> patrols = taskMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(taskToTaskVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Task> tasks) {
        for (Task task : tasks) {
            taskMapper.insert(task);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto saveTask(TaskVo taskVo) {
        Task task = taskVoToTask(taskVo);
        task.setTaskId(UUIDUtil.get32UUID());
        task.setCreateTime((int) TimeUtil.getTimeStamp());
        int insert = taskMapper.insert(task);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String taskId) {
        QueryWrapper<Task> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("task_id",taskId);
        int i = taskMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> taskIds) {
        for (String taskId : taskIds) {
            QueryWrapper<Task> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("task_id",taskId);
            int i = taskMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("task batch delete exception caused by taskId = " + taskId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(TaskVo taskVo) {
        Task task = taskVoToTask(taskVo);
        task.setCreateTime(null);
        UpdateWrapper<Task> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("task_id",task.getTaskId());
        int i = taskMapper.update(task, updateWrapper);
        return checkUpdate(i);
    }

    private List<TaskVo> taskToTaskVo(List<Task> tasks) {
        List<TaskVo> taskVos = new ArrayList<>();
        for (Task task : tasks) {
            TaskVo taskVo = new TaskVo();
            try {
                BeanUtils.copyProperties(taskVo, task);
                taskVo.setCreateTime(TimeUtil.timeStampToDate(task.getCreateTime() + "", null));
                taskVo.setStartTime(TimeUtil.timeStampToDate(task.getStartTime() + "", null));
                taskVo.setEndTime(TimeUtil.timeStampToDate(task.getEndTime() + "", null));
                taskVos.add(taskVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return taskVos;
    }

    private SystemBaseDto checkUpdate(Integer update) {
        if(update  > 0)
            return SystemBaseDto.getOK();
        return SystemBaseDto.getFAIL();
    }

    private SystemBaseDto checkList(List list) {
        return checkList(list, true);
    }

    private SystemBaseDto checkList(List list, boolean toAreaVo) {
        if(list != null && list.size() > 0){
            if(toAreaVo)
                return SystemBaseDto.getOK(taskToTaskVo(list), null);
            else
                return SystemBaseDto.getOK(list, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private Task taskVoToTask(TaskVo taskVo) {
        Task task = new Task();
        try {
            BeanUtils.copyProperties(task, taskVo);
            task.setStartTime(Integer.valueOf(TimeUtil.simpleDateTotimeStamp(taskVo.getStartTime())));
            task.setEndTime(Integer.valueOf(TimeUtil.simpleDateTotimeStamp(taskVo.getEndTime())));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return task;
    }
    
}
