package com.jn.service;

import com.jn.dao.ReferenceDAO;
import com.jn.domain.ReferenceDO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ReferenceServiceImpl
 * @Author zhengcheng
 * @Date 2018/9/17 11:22
 **/
@Slf4j
@Service
public class ReferenceServiceImpl implements ReferenceService{

    @Autowired
    private ReferenceDAO referenceDAO;

    @Override
    public Map dbPoolSelect(Map map) {
        Map map2 = new HashMap();
        String deviceId = (String) map.get("deviceId");
        String serviceId = (String) map.get("serviceId");
        String serviceType = (String) map.get("serviceType");
        List<ReferenceDO> referenceDOList = referenceDAO.selectReferenceByProperties(deviceId, serviceId, serviceType);
        if (referenceDOList != null && referenceDOList.size() == 1) {
            ReferenceDO referenceDO = referenceDOList.get(0);
            map2.put("taskMask",referenceDO.getDbRName());
            map2.put("Offset", referenceDO.getDataOffset());
            log.info("[ReferenceServiceImpl][Info] map get successful, the map is {}", map2.toString());
        }
        return map2;
    }
}
