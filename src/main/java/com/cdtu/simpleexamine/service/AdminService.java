package com.cdtu.simpleexamine.service;


import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AdminVo;
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
public interface AdminService {

    SystemBaseDto List();

    SystemBaseDto login(AdminVo adminVo);

    Admin getByUsername(String username);

    @Transactional(readOnly = false)
    SystemBaseDto disable(String adminId);

    @Transactional(readOnly = false)
    SystemBaseDto enable(String adminId);

}
