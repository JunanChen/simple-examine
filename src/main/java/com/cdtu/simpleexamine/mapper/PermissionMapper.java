package com.cdtu.simpleexamine.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cdtu.simpleexamine.pojo.dbo.Permission;
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
public interface PermissionMapper extends BaseMapper<Permission> {

    List<Permission> selectListByAdminId(String adminId);

    List<Permission> selectListByRoleId(Integer roleId);

    IPage<Permission> selectByPage(Page<Permission> page, @Param("ew") QueryWrapper<Permission> queryWrapper);

}
