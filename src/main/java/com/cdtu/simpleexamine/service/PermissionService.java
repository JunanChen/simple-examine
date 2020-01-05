package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Permission;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *      权限服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Transactional(readOnly = true)
public interface PermissionService {

    List<Permission> getByAdminId(String adminId);

    List<Permission> getByRoleId(Integer roleId);

    SystemBaseDto page(Integer pageNo, Integer pageSize, String search);

    SystemBaseDto allTree();

}
