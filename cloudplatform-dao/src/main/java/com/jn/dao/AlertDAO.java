package com.jn.dao;

import com.jn.domain.AlertDO;

/**
 * @ClassName AlertDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:33
 **/
public interface AlertDAO {

    /**
     * 插入Alert
     *
     * @PARAM alertDO
     * @RETURN
     */
    Integer insertAlert(AlertDO alertDO);
}
