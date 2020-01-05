package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.RolesPermission;
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
public interface RolesPermissionService extends IService<RolesPermission> {

    @Transactional
    void deleteByRolesId(Integer roleId);

}
