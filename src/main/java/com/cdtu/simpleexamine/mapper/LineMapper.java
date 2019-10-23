package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Line;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.LineVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public interface LineMapper extends BaseMapper<Line> {

    List<Line> selectByPage(Page<LineVo> page);

    List<Line> selectBySearch(String search, Integer beginRows, Integer pageSize);
}
