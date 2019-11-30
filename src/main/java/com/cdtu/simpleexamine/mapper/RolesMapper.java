package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.dbo.Roles;
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
public interface RolesMapper extends BaseMapper<Roles> {

    List<Roles> selectListByAdminId(String adminId);


}
