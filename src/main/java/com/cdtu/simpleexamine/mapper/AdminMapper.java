package com.cdtu.simpleexamine.mapper;

import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

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
}
