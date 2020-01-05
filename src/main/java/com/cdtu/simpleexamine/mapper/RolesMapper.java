package com.cdtu.simpleexamine.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.pojo.dbo.Roles;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
public interface RolesMapper extends BaseMapper<Roles> {

    List<Roles> selectListByAdminId(String adminId);

    IPage<Roles> selectByPage(Page<Roles> page, @Param("ew") QueryWrapper<Roles> queryWrapper);

}
