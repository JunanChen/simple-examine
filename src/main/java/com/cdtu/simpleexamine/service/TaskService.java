package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Task;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.TaskVo;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public interface TaskService extends IService<Task> {

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Task> tasks);

    @Transactional(readOnly = false)
    SystemBaseDto saveTask(TaskVo taskVo);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String taskId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> taskIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(TaskVo taskVo);
}
