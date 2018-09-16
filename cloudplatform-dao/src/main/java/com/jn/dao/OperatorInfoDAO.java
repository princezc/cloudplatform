package com.jn.dao;

import com.jn.domain.OperatorInfoDO;

import java.util.List;

/**
 * @ClassName OperatorInfoDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:48
 **/
public interface OperatorInfoDAO {

    /**
     * 插入operatorInfo
     *
     * @PARAM operatorInfoDO
     * @RETURN
     */
    Integer insertOperatorInfo(OperatorInfoDO operatorInfoDO);

    /**
     * 获取OperatorInfo对应记录
     *
     * @PARAM userName
     * @RETURN List<OperatorInfoDO>
     */
    List<OperatorInfoDO> selectOperatorInfoByName(String userName);
}
