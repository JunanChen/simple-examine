package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.cdtu.simpleexamine.pojo.dbo.Roles;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Transactional(readOnly = true)
public interface RolesService extends IService<Roles> {

    List<Roles> getByAdminId(String adminId);

    SystemBaseDto getAll();

    SystemBaseDto getPermissions(Integer roleId);

    @Transactional(readOnly = false)
    SystemBaseDto disable(Integer roleId);

    @Transactional(readOnly = false)
    SystemBaseDto enable(Integer roleId);

    @Transactional(readOnly = false)
    SystemBaseDto addPermissions(Integer roleId, List<Permission> permissions);

    SystemBaseDto search(Integer pageNo, Integer pageSize, String search);

    @Transactional
    SystemBaseDto update(Roles roles);

    @Transactional
    SystemBaseDto deleteById(Integer roleId);

}
