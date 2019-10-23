package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Patrol;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.PatrolVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-20
 */
public interface PatrolMapper extends BaseMapper<Patrol> {

    List<Patrol> selectByPage(Page<PatrolVo> page);

    List<Patrol> selectBySearch(@Param("search") String search, @Param("beginRows") Integer beginRows, @Param("pageSize") Integer pageSize);

}
