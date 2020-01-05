package com.cdtu.simpleexamine.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
public interface AdminMapper extends BaseMapper<Admin> {

    Admin selectByUsername(String username);

    IPage<Admin> selectByPage(Page<Admin> page, @Param("ew") QueryWrapper<Admin> queryWrapper);

}
