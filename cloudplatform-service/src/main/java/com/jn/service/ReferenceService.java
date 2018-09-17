package com.jn.service;

import java.util.Map;

/**
 * @ClassName ReferenceService
 * @Author zhengcheng
 * @Date 2018/9/17 11:18
 **/
public interface ReferenceService {

    /**
     * 获取reference db 信息接口
     * @Param map
     * @Return
     **/
    Map dbPoolSelect(Map map);
}
