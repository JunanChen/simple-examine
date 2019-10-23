package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.PatrolItem;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author junan
 * @since 2019-10-21
 */
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public interface PatrolItemService extends IService<PatrolItem> {

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<PatrolItem> patrolItems);

    @Transactional(readOnly = false)
    SystemBaseDto savePatrolItem(PatrolItem patrolItem);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String patrolItemId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> patrolItemIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(PatrolItem patrolItem);

}
