package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Task;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.TaskVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public interface TaskMapper extends BaseMapper<Task> {

    List<Task> selectByPage(Page<TaskVo> page);

    List<Task> selectBySearch(String search, Integer beginRows, Integer pageSize);
}
