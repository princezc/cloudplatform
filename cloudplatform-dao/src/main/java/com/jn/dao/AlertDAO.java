package com.jn.dao;

import com.jn.domain.AlertDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName AlertDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:33
 **/
@Mapper
public interface AlertDAO {

    /**
     * 插入Alert
     *
     * @PARAM alertDO
     * @RETURN
     */
    Integer insertAlert(AlertDO alertDO);

    /**
     * 获取Alert信息
     *
     * @PARAM deviceId
     * @RETURN
     */
    List<AlertDO> selectAlertById(String deviceId);
}
