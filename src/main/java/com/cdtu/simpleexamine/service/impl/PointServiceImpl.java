package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Point;
import com.cdtu.simpleexamine.mapper.PointMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.PointVo;
import com.cdtu.simpleexamine.service.PointService;
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
public class PointServiceImpl extends ServiceImpl<PointMapper, Point> implements PointService {


    @Autowired
    private PointMapper pointMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<PointVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = pointMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Point> patrols = pointMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(pointToPointVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<PointVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Point> queryWrapper = new QueryWrapper();
        queryWrapper.eq("point_id", search);

        Integer integer = pointMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Point> patrols = pointMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(pointToPointVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Point> points) {
        for (Point point : points) {
            pointMapper.insert(point);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto savePoint(PointVo pointVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Point point = pointVoToPoint(pointVo);
        point.setCreateTime((int) TimeUtil.getTimeStamp());
        point.setCreateBy(admin.getAdminId());
        point.setUpdateTime((int) TimeUtil.getTimeStamp());
        point.setUpdateBy(admin.getAdminId());
        point.setPointId(UUIDUtil.get32UUID());
        int insert = pointMapper.insert(point);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String pointId) {
        QueryWrapper<Point> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("point_id",pointId);
        int i = pointMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> pointIds) {
        for (String pointId : pointIds) {
            QueryWrapper<Point> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("point_id",pointId);
            int i = pointMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("point batch delete exception caused by pointId = " + pointId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(PointVo pointVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Point point = pointVoToPoint(pointVo);
        point.setUpdateTime((int) TimeUtil.getTimeStamp());
        point.setUpdateBy(admin.getAdminId());
        point.setCreateTime(null);
        int i = pointMapper.updateById(point);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto all() {
        List<Point> points = pointMapper.selectList(null);
        return checkList(points, false);
    }

    private List<PointVo> pointToPointVo(List<Point> points) {
        List<PointVo> pointVos = new ArrayList<>();
        for (Point point : points) {
            PointVo pointVo = new PointVo();
            try {
                BeanUtils.copyProperties(pointVo, point);
                pointVo.setCreateTime(TimeUtil.timeStampToDate(point.getCreateTime() + "", null));
                pointVo.setUpdateTime(TimeUtil.timeStampToDate(point.getUpdateTime() + "", null));
                pointVos.add(pointVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return pointVos;
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
                return SystemBaseDto.getOK(pointToPointVo(list), null);
            else
                return SystemBaseDto.getOK(list, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private Point pointVoToPoint(PointVo pointVo) {
        Point point = new Point();
        try {
            BeanUtils.copyProperties(point, pointVo);
            point.setUpdateTime((int) TimeUtil.getTimeStamp());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return point;
    }
    
}
