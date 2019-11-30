package com.cdtu.simpleexamine.service;


import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AdminVo;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

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

    SystemBaseDto login(AdminVo adminVo, HttpServletRequest request);

    Admin getByUsername(String username);

    @Transactional(readOnly = false)
    SystemBaseDto disable(String adminId);

    @Transactional(readOnly = false)
    SystemBaseDto enable(String adminId);

    SystemBaseDto logOut();

    SystemBaseDto getAllInfo();

    @Transactional
    SystemBaseDto changePassword(String oldPassword, String newPassword);

    SystemBaseDto getInfo();

    @Transactional
    SystemBaseDto updateInfo(AdminVo adminVo);

}
