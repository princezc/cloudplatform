package com.jn.service;

import com.rtdb.api.exception.EncodePacketErrorException;
import com.rtdb.api.exception.UnexpectedMethodException;

import java.io.IOException;

/**京能公司db接口
 * @ClassName JnDbService
 * @Author zhengcheng
 * @Date 2018/9/14 16:44
 **/
public interface JnDbService {

    /**
     * 中国电信平台登录接口
     * @Param tagMask
     * @Param temp
     * @Param offset
     * @Return
     **/
    void upload(String tagMask ,float temp,float offset) throws Exception;
}
