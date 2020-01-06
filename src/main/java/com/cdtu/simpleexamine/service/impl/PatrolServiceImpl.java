package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Patrol;
import com.cdtu.simpleexamine.mapper.PatrolMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PatrolVo;
import com.cdtu.simpleexamine.service.PatrolService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author junan
 * @since 2019-10-19
 */
@Service
public class PatrolServiceImpl extends ServiceImpl<PatrolMapper, Patrol> implements PatrolService {

    @Autowired
    private PatrolMapper patrolMapper;

    @Override
    public SystemBaseDto all() {
        List<Patrol> patrols = patrolMapper.selectList(null);
        return checkList(patrols);
    }

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<PatrolVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = patrolMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Patrol> patrols = patrolMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(patrolToPatrolVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Patrol> patrols) {
        for (Patrol patrol : patrols) {
            patrolMapper.insert(patrol);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto savePatrol(PatrolVo patrolVo) {
        Patrol patrol = patrolVoToPatrol(patrolVo);
        patrol.setPatrolId(UUIDUtil.get32UUID());
        int insert = patrolMapper.insert(patrol);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> patrolIds) {
        for (String patrolId : patrolIds) {
            QueryWrapper<Patrol> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("patrol_id",patrolId);
            int i = patrolMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("patrolId batch delete exception caused by id = " + patrolId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto delete(String patrolId) {
        QueryWrapper<Patrol> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("patrol_id",patrolId);
        int i = patrolMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto update(PatrolVo patrolVo) {
        Patrol patrol = patrolVoToPatrol(patrolVo);
        int i = patrolMapper.updateById(patrol);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<PatrolVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Patrol> queryWrapper = new QueryWrapper();
        queryWrapper.eq("patrol_id", search);

        Integer integer = patrolMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Patrol> patrols = patrolMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(patrolToPatrolVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private SystemBaseDto checkUpdate(Integer update) {
        if(update  > 0)
            return SystemBaseDto.getOK();
        return SystemBaseDto.getFAIL();
    }

    private SystemBaseDto checkList(List list) {
        if(list != null && list.size() > 0)
            return SystemBaseDto.getOK(patrolToPatrolVo(list), null);
        return SystemBaseDto.getDataNull();
    }


    private List<PatrolVo> patrolToPatrolVo(List<Patrol> patrols) {
        List<PatrolVo> patrolVos = new ArrayList<>();
        for (Patrol patrol : patrols) {
            PatrolVo patrolVo = new PatrolVo();
            try {
                BeanUtils.copyProperties(patrolVo, patrol);
                patrolVo.setPatrolTime(TimeUtil.timeStampToDate(patrol.getPatrolTime() + "", null));
                patrolVos.add(patrolVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return patrolVos;
    }


    private Patrol patrolVoToPatrol(PatrolVo patrolVo) {
        Patrol patrol = new Patrol();
        try {
            patrolVo.setPatrolTime(TimeUtil.simpleDateTotimeStamp(patrolVo.getPatrolTime() + ""));
            BeanUtils.copyProperties(patrol, patrolVo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patrol;
    }

    @Override
    public Long getNums() {
        return Long.valueOf(patrolMapper.selectCount(null));
    }
}
