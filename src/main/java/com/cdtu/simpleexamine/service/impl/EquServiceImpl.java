package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Equ;
import com.cdtu.simpleexamine.mapper.EquMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.EquVo;
import com.cdtu.simpleexamine.service.EquService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.SecurityUtils;
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
 * @since 2019-10-22
 */
@Service
public class EquServiceImpl extends ServiceImpl<EquMapper, Equ> implements EquService {

    @Autowired
    private EquMapper equMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<EquVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = equMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Equ> patrols = equMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(equToEquVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<EquVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Equ> queryWrapper = new QueryWrapper();
        queryWrapper.eq("equ_id", search);

        Integer integer = equMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Equ> patrols = equMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(equToEquVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Equ> equs) {
        for (Equ equ : equs) {
            equMapper.insert(equ);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto saveEqu(EquVo equVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Equ equ = equVoToEqu(equVo);
        equ.setEquId(UUIDUtil.get32UUID());
        equ.setCreateTime((int) TimeUtil.getTimeStamp());
        equ.setCreateBy(admin.getAdminId());
        int insert = equMapper.insert(equ);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String equId) {
        QueryWrapper<Equ> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("equ_id",equId);
        int i = equMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> equIds) {
        for (String equId : equIds) {
            QueryWrapper<Equ> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("equ_id",equId);
            int i = equMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("equ batch delete exception caused by equId = " + equId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(EquVo equVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Equ equ = equVoToEqu(equVo);
        equ.setUpdateTime((int) TimeUtil.getTimeStamp());
        equ.setUpdateBy(admin.getAdminId());
        equ.setCreateTime(null);
        int i = equMapper.updateById(equ);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto all() {
        List<Equ> equs = equMapper.selectList(null);
        return checkList(equs, false);
    }

    private List<EquVo> equToEquVo(List<Equ> equs) {
        List<EquVo> equVos = new ArrayList<>();
        for (Equ equ : equs) {
            EquVo equVo = new EquVo();
            try {
                BeanUtils.copyProperties(equVo, equ);
                equVo.setCreateTime(TimeUtil.timeStampToDate(equ.getCreateTime() + "", null));
                equVo.setUpdateTime(TimeUtil.timeStampToDate(equ.getUpdateTime() + "", null));
                equVos.add(equVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return equVos;
    }

    private SystemBaseDto checkUpdate(Integer update) {
        if(update  > 0)
            return SystemBaseDto.getOK();
        return SystemBaseDto.getFAIL();
    }

    private SystemBaseDto checkList(List list) {
        return checkList(list, true);
    }

    private SystemBaseDto checkList(List list, boolean toAreaVo) {
        if(list != null && list.size() > 0){
            if(toAreaVo)
                return SystemBaseDto.getOK(equToEquVo(list), null);
            else
                return SystemBaseDto.getOK(list, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private Equ equVoToEqu(EquVo equVo) {
        Equ equ = new Equ();
        try {
            BeanUtils.copyProperties(equ, equVo);
            equ.setUpdateTime((int) TimeUtil.getTimeStamp());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return equ;
    }

    @Override
    public Long getNums() {
        return Long.valueOf(equMapper.selectCount(null));
    }
}
