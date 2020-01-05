package com.cdtu.simpleexamine.pojo.dbo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.cdtu.simpleexamine.serializer.UnixConverterDeSerializer;
import com.cdtu.simpleexamine.serializer.UnixConverterSerializer;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author junan
 * @since 2019-10-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Permission extends Model<Permission> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "permission_id", type = IdType.AUTO)
    private Integer permissionId;

    /**
     * 权限名
     */
    private String permissionName;

    /**
     * 所属模块
     */
    private Integer permissionModule;

    /**
     * 权限的描述
     */
    private String permissionDesc;

    /**
     * 权限的状态 0：可用  1：禁用
     */
    private Integer permissionStatu;

    @JsonSerialize(using = UnixConverterSerializer.class)
    @JsonDeserialize(using = UnixConverterDeSerializer.class)
    private Integer updateTime;

    @TableField(exist = false)
    private Module module = new Module();

}
