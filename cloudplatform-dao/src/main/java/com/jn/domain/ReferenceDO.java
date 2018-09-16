package com.jn.domain;

import lombok.Data;

/**
 * @ClassName ReferenceDO
 * @Author zhengcheng
 * @Date 2018/9/16 14:18
 **/
@Data
public class ReferenceDO {

    public String deviceId;
    public String serviceId;
    public String serviceType;
    public String dbRName;
    public float dataOffset;
    public String description;
}
