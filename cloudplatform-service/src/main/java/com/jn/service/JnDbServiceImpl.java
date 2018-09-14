package com.jn.service;

import com.rtdb.api.exception.EncodePacketErrorException;
import com.rtdb.api.exception.UnexpectedMethodException;
import com.rtdb.enums.DataSort;
import com.rtdb.model.DoubleData;
import com.rtdb.model.SearchConditionTotal;
import com.rtdb.service.impl.BaseImpl;
import com.rtdb.service.impl.ServerImpl;
import com.rtdb.service.impl.SnapshotImpl;
import com.rtdb.service.inter.Base;
import com.rtdb.service.inter.Server;
import com.rtdb.service.inter.Snapshot;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName JnDbServiceImpl
 * @Author zhengcheng
 * @Date 2018/9/14 16:47
 **/
@Slf4j
@Service
public class JnDbServiceImpl implements JnDbService{

    @Value("${dbServerIp}")
    private String dbServerIp;

    @Value("${dbServerPort}")
    private Integer dbServerPort;

    @Value("${dbServerUserName}")
    private String dbServerUserName;

    @Value("${dbServerPassword}")
    private String dbServerPassword;

    @Override
    public void upload(String tagMask, float temp, float offset) throws Exception {
        log.info("[JnDbServiceImpl][Info] the actual data is {}", temp);
        Server server = new ServerImpl(dbServerIp, dbServerPort, dbServerUserName, dbServerPassword);
        server.connect();
        server.login();

        Base base = new BaseImpl((ServerImpl) server);
        SearchConditionTotal condition = new SearchConditionTotal();
        condition.setTagmask(tagMask);
        int[] ids = base.search(condition, 1, DataSort.SORT_BY_ID);

        Snapshot snap = new SnapshotImpl((ServerImpl) server);
        List<DoubleData> list = new ArrayList();
        DoubleData data = new DoubleData();
        data.setDateTime(new Date());
        temp=temp+offset;
        data.setValue(temp);
        data.setId(ids[0]);
        data.setQuality((short) 0);
        list.add(data);
        snap.putDoubleSnapshots(list);
        log.info("[JnDbServiceImpl][Info] data is added to db");
        server.close();
    }
}
