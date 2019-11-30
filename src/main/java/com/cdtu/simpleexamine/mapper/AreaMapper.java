package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Area;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.AreaVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public interface AreaMapper extends BaseMapper<Area> {

    List<Area> selectByPage(Page<AreaVo> page);

    List<Area> selectBySearch(String search, Integer beginRows, Integer pageSize);

    List<Area> selectAllAndLine();

}
