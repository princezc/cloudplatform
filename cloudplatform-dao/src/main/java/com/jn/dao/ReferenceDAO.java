package com.jn.dao;

import com.jn.domain.ReferenceDO;

import java.util.List;

/**
 * @ClassName ReferenceDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:38
 **/
public interface ReferenceDAO {

    /**
     * 插入reference
     *
     * @PARAM referenceDO
     * @RETURN
     */
    Integer insertReference(ReferenceDO referenceDO);

    /**
     * 获取reference对应记录
     *
     * @PARAM deviceId
     * @RETURN List<ReferenceDO>
     */
    List<ReferenceDO> selectReferenceById(String deviceId);
}
