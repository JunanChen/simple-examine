package com.cdtu.simpleexamine.enums;

public enum SystemCode {


    /************************* 一般状态 *************************/

    /**
     * 成功状态
     */
    OK(200),

    /**
     * 操作失败
     */
    OPERATION_FAILURE(201),

    /**
     * 请求错误
     */
    BAD_REQUEST(400),

    /**
     * 没有权限
     */
    UNAUTHORIZED(401),

    /**
     * 得到权限，但访问被禁止
     */
    FORBIDDEN(403),

    /**
     * 资源未找到
     */
    NOT_FOUND(404),

    /**
     * 系统内部错误
     */
    SYSTEM_INTERNAL_ERROR(500),

    /************************* 自定义状态 *************************/

    /**
     * 用户名或密码错误
     */
    USERNAME_OR_PASSWORD_ERROR(1000010),

    /**
     * 查询数据为空（用于前端表）
     */
    QUERY_DATA_NULL(1000011),

    /**
     * 验证码输入错误
     */
    IDENTIFYCODE_ERROR(1000012),

    /**
     * 数据格式错误
     */
    DATA_FORMAT_ERROR(1000013),

    /**
     * 文件上传失败
     */
    FILE_UPLOAD_FAILURE(1000014),

    /**
     * 远程服务调用失败
     */
    REMOTE_SERVICE_ERROR(1000015),

    /**
     * 密码错误
     */
    PASSWORD_ERROR(1000016),

    /**
     * 服务熔断
     */
    SERVICE_FUSING_ERROR(1000017),

    /**
     * 内容与数据库内容一致，修改失败
     */
    DATA_REPEAT_UPDATE_ERROR(1000018),

    /**
     * 操作参数错误
     */
    OPERATION_PARAMETER_ERROR(1000019),

    /**
     * 管理员被禁止错误
     */
    LOCKED_ACCOUNT_EXCEPTION(1000020),

    /**
     * 用户不存在异常
     */
    ACCOUNT_NOT_EXIST_EXCEPTION(1000022),

    /**
     * 数据库操作异常
     */
    DATABASE_OPERATE_EXCEPTION(1000022),

    /**
     * 数据库操作异常
     */
    USER_ALREADY_EXISTS(1000023);

    private final Integer value;

    public Integer Value() {
        return value;
    }

    SystemCode(Integer value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "HttpCodeEnum{ " +
                "value=" + value +
                " }";
    }

}
