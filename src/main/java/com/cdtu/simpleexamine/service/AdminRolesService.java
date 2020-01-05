package com.cdtu.simpleexamine.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cdtu.simpleexamine.pojo.dbo.AdminRoles;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Transactional(readOnly = true)
public interface AdminRolesService extends IService<AdminRoles> {

    @Transactional
    void deleteByWrapper(QueryWrapper<AdminRoles> queryWrapper);

}
