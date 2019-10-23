package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.PatrolItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-21
 */
public interface PatrolItemMapper extends BaseMapper<PatrolItem> {

    List<PatrolItem> selectByPage(Page<PatrolItem> page);

}
