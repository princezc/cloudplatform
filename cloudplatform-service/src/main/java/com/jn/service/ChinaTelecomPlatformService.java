package com.jn.service;

/**
 * @ClassName ChinaTelecomPlatformService
 * @Author zhengcheng
 * @Date 2018/9/14 16:39
 **/
public interface ChinaTelecomPlatformService {

    /**
     * 中国电信平台登录接口
     * @Param url
     * @Param param
     * @Return
     **/
    String sendLogInMessage(String url, String param);
}
