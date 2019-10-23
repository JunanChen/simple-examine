package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Area;
import com.cdtu.simpleexamine.mapper.AreaMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.AreaVo;
import com.cdtu.simpleexamine.service.AreaService;
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
 * @since 2019-10-22
 */
@Service
public class AreaServiceImpl extends ServiceImpl<AreaMapper, Area> implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<AreaVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = areaMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Area> patrols = areaMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(areaToAreaVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<AreaVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Area> queryWrapper = new QueryWrapper();
        queryWrapper.eq("area_id", search);

        Integer integer = areaMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Area> patrols = areaMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(areaToAreaVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Area> areas) {
        for (Area area : areas) {
            areaMapper.insert(area);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto saveArea(AreaVo areaVo) {
        Area area = areaVoToArea(areaVo);
        area.setAreaId(UUIDUtil.get32UUID());
        area.setCreateTime((int) TimeUtil.getTimeStamp());
        int insert = areaMapper.insert(area);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String areaId) {
        QueryWrapper<Area> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("area_id",areaId);
        int i = areaMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> areaIds) {
        for (String areaId : areaIds) {
            QueryWrapper<Area> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("area_id",areaId);
            int i = areaMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("area batch delete exception caused by areaId = " + areaId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(AreaVo areaVo) {
        Area area = areaVoToArea(areaVo);
        area.setUpdateTime((int) TimeUtil.getTimeStamp());
        area.setCreateTime(null);
        UpdateWrapper<Area> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("area_id",area.getAreaId());
        int i = areaMapper.update(area, updateWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto all() {
        List<Area> areas = areaMapper.selectList(null);
        return checkList(areas, false);
    }

    private List<AreaVo> areaToAreaVo(List<Area> areas) {
        List<AreaVo> areaVos = new ArrayList<>();
        for (Area area : areas) {
            AreaVo areaVo = new AreaVo();
            try {
                BeanUtils.copyProperties(areaVo, area);
                areaVo.setCreateTime(TimeUtil.timeStampToDate(area.getCreateTime() + "", null));
                areaVo.setUpdateTime(TimeUtil.timeStampToDate(area.getUpdateTime() + "", null));
                areaVos.add(areaVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return areaVos;
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
                return SystemBaseDto.getOK(areaToAreaVo(list), null);
            else
                return SystemBaseDto.getOK(list, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private Area areaVoToArea(AreaVo areaVo) {
        Area area = new Area();
        try {
            BeanUtils.copyProperties(area, areaVo);
            area.setUpdateTime((int) TimeUtil.getTimeStamp());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return area;
    }
}
