package com.cdtu.simpleexamine.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.cdtu.simpleexamine.exception.BatchDeleteException;
import com.cdtu.simpleexamine.pojo.Page;
import com.cdtu.simpleexamine.pojo.dbo.Admin;
import com.cdtu.simpleexamine.pojo.dbo.Line;
import com.cdtu.simpleexamine.mapper.LineMapper;
import com.cdtu.simpleexamine.pojo.dto.SystemBaseDto;
import com.cdtu.simpleexamine.pojo.vo.LineVo;
import com.cdtu.simpleexamine.service.LineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cdtu.simpleexamine.utils.TimeUtil;
import com.cdtu.simpleexamine.utils.UUIDUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.security.auth.Subject;
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
public class LineServiceImpl extends ServiceImpl<LineMapper, Line> implements LineService {

    @Autowired
    private LineMapper lineMapper;

    @Override
    public SystemBaseDto all(Integer pageNow, Integer pageSize) {
        Page<LineVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        Integer integer = lineMapper.selectCount(null);
        page.setTotalCount(Long.valueOf(integer));

        List<Line> patrols = lineMapper.selectByPage(page);
        if(patrols != null && patrols.size() > 0) {
            page.setList(lineToLineVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto allBySearch(String search, Integer pageNow, Integer pageSize) {
        Page<LineVo> page = new Page<>();
        page.setPageNow(pageNow);
        page.setPageSize(pageSize);

        QueryWrapper<Line> queryWrapper = new QueryWrapper();
        queryWrapper.eq("line_id", search);

        Integer integer = lineMapper.selectCount(queryWrapper);
        page.setTotalCount(Long.valueOf(integer));

        List<Line> patrols = lineMapper.selectBySearch(search, page.getBeginRows(), page.getPageSize());
        if(patrols != null && patrols.size() > 0) {
            page.setList(lineToLineVo(patrols));
            return SystemBaseDto.getOK(page, null);
        }
        return SystemBaseDto.getDataNull();
    }

    @Override
    public SystemBaseDto saveList(List<Line> lines) {
        for (Line line : lines) {
            lineMapper.insert(line);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto saveLine(LineVo lineVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Line line = lineVoToLine(lineVo);
        line.setLineId(UUIDUtil.get32UUID());
        line.setCreateTime((int) TimeUtil.getTimeStamp());
        line.setCreateBy(admin.getAdminId());
        line.setUpdateTime((int) TimeUtil.getTimeStamp());
        line.setUpdateBy(admin.getAdminId());
        int insert = lineMapper.insert(line);
        return checkUpdate(insert);
    }

    @Override
    public SystemBaseDto delete(String lineId) {
        QueryWrapper<Line> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("line_id",lineId);
        int i = lineMapper.delete(queryWrapper);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto batchDelete(List<String> lineIds) {
        for (String lineId : lineIds) {
            QueryWrapper<Line> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("line_id",lineId);
            int i = lineMapper.delete(queryWrapper);
            if(i <= 0)
                throw new BatchDeleteException("line batch delete exception caused by lineId = " + lineId);
        }
        return SystemBaseDto.getOK();
    }

    @Override
    public SystemBaseDto update(LineVo lineVo) {
        Admin admin = (Admin) SecurityUtils.getSubject().getPrincipal();
        Line line = lineVoToLine(lineVo);
        line.setUpdateTime((int) TimeUtil.getTimeStamp());
        line.setUpdateBy(admin.getAdminId());
        line.setCreateTime(null);
        int i = lineMapper.updateById(line);
        return checkUpdate(i);
    }

    @Override
    public SystemBaseDto all() {
        QueryWrapper<Line> queryWrapper = new QueryWrapper();
        queryWrapper.select("line_id", "line_name", "line_desc");
        List<Line> lines = lineMapper.selectList(queryWrapper);
        return checkList(lines, false);
    }

    private List<LineVo> lineToLineVo(List<Line> lines) {
        List<LineVo> lineVos = new ArrayList<>();
        for (Line line : lines) {
            LineVo lineVo = new LineVo();
            try {
                BeanUtils.copyProperties(lineVo, line);
                lineVo.setCreateTime(TimeUtil.timeStampToDate(line.getCreateTime() + "", null));
                lineVo.setUpdateTime(TimeUtil.timeStampToDate(line.getUpdateTime() + "", null));
                lineVos.add(lineVo);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lineVos;
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
                return SystemBaseDto.getOK(lineToLineVo(list), null);
            else
                return SystemBaseDto.getOK(list, null);
        }
        return SystemBaseDto.getDataNull();
    }

    private Line lineVoToLine(LineVo lineVo) {
        Line line = new Line();
        try {
            BeanUtils.copyProperties(line, lineVo);
            line.setUpdateTime((int) TimeUtil.getTimeStamp());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return line;
    }
    
}
