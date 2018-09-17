package com.jn.domain;

import lombok.Data;

/**
 * @ClassName AlertDO
 * @Author zhengcheng
 * @Date 2018/9/16 14:21
 **/
@Data
public class AlertDO {

    public String deviceId;
    public String deviceState;
    public String description;
    public String operator;
    public String tagMask;
}
