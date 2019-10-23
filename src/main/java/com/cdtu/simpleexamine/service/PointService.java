package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Point;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PointVo;
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
public interface PointService extends IService<Point> {

    SystemBaseDto all(Integer pageNow, Integer pageSize);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Point> points);

    @Transactional(readOnly = false)
    SystemBaseDto savePoint(PointVo pointVo);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String pointId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> pointIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(PointVo pointVo);

    SystemBaseDto all();

}
