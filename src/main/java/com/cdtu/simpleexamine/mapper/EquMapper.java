package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Equ;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cdtu.simpleexamine.pojo.vo.EquVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
public interface EquMapper extends BaseMapper<Equ> {

    List<Equ> selectByPage(Page<EquVo> page);

    List<Equ> selectBySearch(String search, Integer beginRows, Integer pageSize);

}
