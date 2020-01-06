package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.mapper.EquFailMapper;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.EquFail;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.EquFailVo;
import com.cdtu.simpleexamine.service.EquFailService;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author junan
 * @version V1.0
 * @className EquFailServiceImpl
 * @disc
 * @date 2019/11/1 17:12
 */
@Service
public class EquFailServiceImpl extends ServiceImpl<EquFailMapper, EquFail> implements EquFailService {

    
    @Autowired
    private EquFailMapper equFailMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<EquFailVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = equFailMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<EquFail> equFails = equFailMapper.selectByPage(page);
        if(equFails != null && equFails.size() > 0) {
            page.setList(equFailToEquFailVo(equFails));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<EquFailVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<EquFail> queryWrapper = new QueryWrapper();
        queryWrapper.eq("equFail_id", search);

        Integer integer = equFailMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<EquFail> equFails = equFailMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(equFails != null && equFails.size() > 0) {
            page.setList(equFailToEquFailVo(equFails));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto update(EquFailVo equFailVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        EquFail equFail = equFailVoToEquFail(equFailVo);
        equFail.setDealBy(admin.getAdminId());
        int i = equFailMapper.updateById(equFail);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto saveEquFail(EquFailVo equFailVo) {
        EquFail equFail = equFailVoToEquFail(equFailVo);
        equFail.setFailId(UUIDUtil.get32UUID());
        equFail.setFailAppearTime((int) TimeUtil.getTimeStamp());
        equFail.setFailDealTime(null);
        int i = equFailMapper.insert(equFail);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto delete(String equFailId) {
        int i = equFailMapper.deleteById(equFailId);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> equFailIds) {
        for (String equFailId : equFailIds) {
            int i = equFailMapper.deleteById(equFailId);
            if(i < 1)
                throw new BatchDeleteException("equFailMapper batchDelete error by equFailId = " + equFailId);
        }
        return SystemBaseDto.getOK();
    }

    private List<EquFailVo> equFailToEquFailVo(List<EquFail> equFails) {
        List<EquFailVo> equFailVos = new ArrayList<>();
        for (EquFail equFail : equFails) {
            EquFailVo equFailVo = new EquFailVo();
            try {
                BeanUtils.copyProperties(equFailVo, equFail);
                equFailVo.setFailAppearTime(TimeUtil.timeStampToDate(equFail.getFailAppearTime() + "", null));
                equFailVo.setFailDealTime(TimeUtil.timeStampToDate(equFail.getFailDealTime() + "", null));
                equFailVos.add(equFailVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return equFailVos;
    }

    private EquFail equFailVoToEquFail(EquFailVo equFailVo) {
        EquFail equFail = new EquFail();
        try {
            BeanUtils.copyProperties(equFail, equFailVo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        equFail.setFailAppearTime(null);
        equFail.setFailDealTime((int) TimeUtil.getTimeStamp());
        return equFail;
    }

    private SystemBaseDto checkUpdate(Integer update) {
        if(update  > 0)
            return SystemBaseDto.getOK();
        return SystemBaseDto.getFAIL();
    }

    @Override
    public Long getNumsByToDay() {
        Long todayUnix = TimeUtil.getTodayUnix();
        Long nextDayUnix = TimeUtil.getNextDayUnix();

        QueryWrapper<EquFail> wrapper = new QueryWrapper();
        wrapper.ge("fail_appear_time", todayUnix).le("fail_appear_time", nextDayUnix);

        Integer integer = equFailMapper.selectCount(wrapper);

        return Long.valueOf(integer);
    }
}