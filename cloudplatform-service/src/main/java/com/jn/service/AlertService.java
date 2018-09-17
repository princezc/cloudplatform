package com.jn.service;

/**
 * @ClassName AlertService
 * @Author zhengcheng
 * @Date 2018/9/16 15:50
 **/
public interface AlertService {

    /**
     * 判断是否触发警报
     * @Param deviceId 目标设备id
     * @Return
     **/
    Boolean isAlert(String deviceId);

    /**
     * 触发警报
     * @Param deviceId 警报设备id
     * @Return
     **/
    void doAlert(String deviceId);
}
