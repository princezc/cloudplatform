package com.jn.service;

import java.util.Map;

/**
 * @ClassName JsonGetDataService
 * @Author zhengcheng
 * @Date 2018/9/17 11:12
 **/
public interface JsonGetDataService {

    /**
     * 解析json消息接口
     * @Param json
     * @Param map
     * @Return
     **/
    Map parseData(String json, Map map);
}
