package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Patrol;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PatrolVo;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-19
 */
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public interface PatrolService extends IService<Patrol> {

    @Deprecated
    SystemBaseDto all();

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Patrol> patrols);

    @Transactional(readOnly = false)
    SystemBaseDto savePatrol(PatrolVo patrolVo);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> patrolIds);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String patrolId);

    @Transactional(readOnly = false)
    SystemBaseDto update(PatrolVo patrolVo);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    /**
     * 获取全部巡检数据数目
     *
     * @return
     */
    Long getNums();

}
