package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Point;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.PointVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public interface PointMapper extends BaseMapper<Point> {

    List<Point> selectByPage(Page<PointVo> page);

    List<Point> selectBySearch(String search, Integer beginRows, Integer pageSize);
    
}
