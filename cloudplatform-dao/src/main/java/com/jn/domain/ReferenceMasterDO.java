package com.jn.domain;

import lombok.Data;

/**
 * @ClassName ReferenceMasterDO
 * @Author zhengcheng
 * @Date 2018/9/16 14:19
 **/
@Data
public class ReferenceMasterDO {

    public String deviceId;
    public String serviceId;
    public String serviceType;
    public String dbRName;
    public float dataOffset;
    public String description;
}
