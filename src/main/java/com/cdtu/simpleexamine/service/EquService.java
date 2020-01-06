package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Equ;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.EquVo;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-22
 */
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public interface EquService extends IService<Equ> {

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Equ> equs);

    @Transactional(readOnly = false)
    SystemBaseDto saveEqu(EquVo equVo);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String equId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> equIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(EquVo equVo);

    @Deprecated
    SystemBaseDto all();

    /**
     * 总设备数
     *
     * @return
     */
    Long getNums();

}
