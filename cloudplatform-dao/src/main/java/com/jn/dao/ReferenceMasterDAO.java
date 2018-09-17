package com.jn.dao;

import com.jn.domain.ReferenceMasterDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName ReferenceMasterDAO
 * @Author zhengcheng
 * @Date 2018/9/16 14:46
 **/
@Mapper
public interface ReferenceMasterDAO {

    /**
     * 插入referenceMaster
     *
     * @PARAM referenceMasterDO
     * @RETURN
     */
    Integer insertReferenceMaster(ReferenceMasterDO referenceMasterDO);

    /**
     * 获取referenceMaster对应记录
     *
     * @PARAM deviceId
     * @RETURN List<ReferenceMasterDO>
     */
    List<ReferenceMasterDO> selectReferenceMasterById(String deviceId);
}
