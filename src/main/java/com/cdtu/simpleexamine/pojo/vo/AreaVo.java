package com.cdtu.simpleexamine.pojo.vo;

import com.cdtu.simpleexamine.pojo.dbo.Line;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author junan
 * @version V1.0
 * @className AreaVo
 * @disc
 * @date 2019/10/22 9:56
 */
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class AreaVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String areaId;

    private String areaName;

    private String areaAddress;

    private String areaDesc;

    private Integer areaStat;

    private String createTime;

    private String createBy;

    private String updateTime;

    private String updateBy;

    private List<Line> lines;

}