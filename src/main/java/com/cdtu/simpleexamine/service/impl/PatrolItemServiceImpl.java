package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.generator.IDGenerator;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.PatrolItem;
import com.cdtu.simpleexamine.mapper.PatrolItemMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.service.PatrolItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.UUIDUtil;
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
 * @since 2019-10-21
 */
@Service
public class PatrolItemServiceImpl extends ServiceImpl<PatrolItemMapper, PatrolItem> implements PatrolItemService {

    @Autowired
    private PatrolItemMapper patrolItemMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<PatrolItem> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = patrolItemMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<PatrolItem> patrolItems = patrolItemMapper.selectByPage(page);
        if(patrolItems != null && patrolItems.size() > 0) {
            page.setList(patrolItems);
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<PatrolItem> patrolItems) {
        for (PatrolItem patrolItem : patrolItems) {
            patrolItemMapper.insert(patrolItem);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto savePatrolItem(PatrolItem patrolItem) {
        patrolItem.setItemId(UUIDUtil.get32UUID());
        int insert = patrolItemMapper.insert(patrolItem);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String patrolItemId) {
        QueryWrapper<PatrolItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("item_id",patrolItemId);
        int i = patrolItemMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> patrolItemIds) {
        for (String patrolItemId : patrolItemIds) {
            QueryWrapper<PatrolItem> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("item_id",patrolItemId);
            int i = patrolItemMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("patrolItem batch delete exception caused by item_id = " + patrolItemId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(PatrolItem patrolItem) {
        UpdateWrapper<PatrolItem> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("item_id",patrolItem.getItemId());
        int i = patrolItemMapper.update(patrolItem, updateWrapper);
        return checkUpdate(i);
    }


    private SystemBaseDto checkUpdate(Integer update) {
        if(update  > 0)
            return SystemBaseDto.getOK();
        return SystemBaseDto.getFAIL();
    }

    private SystemBaseDto checkList(List list) {
        if(list != null && list.size() > 0)
            return SystemBaseDto.getOK(list, null);
        return SystemBaseDto.getDataNull();
    }
}
