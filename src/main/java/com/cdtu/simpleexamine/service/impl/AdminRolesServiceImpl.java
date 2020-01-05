package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.cdtu.simpleexamine.pojo.dbo.AdminRoles;
import com.cdtu.simpleexamine.mapper.AdminRolesMapper;
import com.cdtu.simpleexamine.service.AdminRolesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Service
public class AdminRolesServiceImpl extends ServiceImpl<AdminRolesMapper, AdminRoles> implements AdminRolesService {

    @Autowired
    private AdminRolesMapper adminRolesMapper;

    @Override
    public void deleteByWrapper(QueryWrapper<AdminRoles> queryWrapper) {
        adminRolesMapper.delete(queryWrapper);
    }
}
