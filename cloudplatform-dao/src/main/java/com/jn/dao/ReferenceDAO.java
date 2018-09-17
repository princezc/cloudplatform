package com.jn.dao;

import com.jn.domain.ReferenceDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName ReferenceDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:38
 **/
@Mapper
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

    /**
     * 获取reference对应记录
     *
     * @PARAM deviceId
     * @PARAM serviceId
     * @PARAM serviceType
     * @RETURN List<ReferenceDO>
     */
    List<ReferenceDO> selectReferenceByProperties(String deviceId, String serviceId, String serviceType);
}
