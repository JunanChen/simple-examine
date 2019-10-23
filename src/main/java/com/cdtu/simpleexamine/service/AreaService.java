package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Area;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AreaVo;
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
public interface AreaService extends IService<Area> {

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Area> areas);

    @Transactional(readOnly = false)
    SystemBaseDto saveArea(AreaVo areaVo);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String areaId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> areaIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(AreaVo areaVo);

    SystemBaseDto all();


}
