package com.cdtu.simpleexamine.service;

import com.cdtu.simpleexamine.pojo.dbo.Line;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.LineVo;
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
public interface LineService extends IService<Line> {


    SystemBaseDto all(Integer pageNow, Integer pageSize);

    SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize);

    @Transactional(readOnly = false)
    SystemBaseDto saveList(List<Line> lines);

    @Transactional(readOnly = false)
    SystemBaseDto saveLine(LineVo lineVo);

    @Transactional(readOnly = false)
    SystemBaseDto delete(String lineId);

    @Transactional(readOnly = false)
    SystemBaseDto batchDelete(List<String> lineIds);

    @Transactional(readOnly = false)
    SystemBaseDto update(LineVo lineVo);

    SystemBaseDto all();

}
