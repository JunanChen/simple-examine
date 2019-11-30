package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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

}
