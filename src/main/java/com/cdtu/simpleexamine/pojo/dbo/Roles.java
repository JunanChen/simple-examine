package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.cdtu.simpleexamine.serializer.UnixConverterDeSerializer;
import com.cdtu.simpleexamine.serializer.UnixConverterSerializer;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;

import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Data
public class Roles extends Model<Roles> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "role_id", type = IdType.AUTO)
    private Integer roleId;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String roleDesc;

    /**
     * 排序号
     */
    private Integer roleOrder;

    /**
     * 角色编码
     */
    private String roleCode;

    /**
     * 角色状态  0：可用   1：禁用
     */
    private Integer roleStatu;

    @JsonSerialize(using = UnixConverterSerializer.class)
    @JsonDeserialize(using = UnixConverterDeSerializer.class)
    private Integer updateTime;

    @TableField(exist = false)
    private List<Integer> permissions;

}
