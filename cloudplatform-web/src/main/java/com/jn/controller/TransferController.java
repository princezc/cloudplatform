package com.jn.controller;

import com.jn.service.JnDbService;
import com.jn.service.JsonGetDataService;
import com.jn.service.ReferenceService;
import com.jn.utils.HttpUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName TransferController
 * @Author zhengcheng
 * @Date 2018/9/17 15:39
 **/
@Controller
@Slf4j
public class TransferController {

    @Autowired
    JsonGetDataService jsonGetDataService;

    @Autowired
    ReferenceService referenceService;

    @Autowired
    JnDbService jnDbService;

    public static Map map = Collections.synchronizedMap(new HashMap());

    @RequestMapping(value = "/aa", method = {RequestMethod.POST})
    @ResponseBody
    public String doTransfer(HttpServletRequest request) {
        try {
            BufferedReader bodyBuffer = request.getReader();
            String body = HttpUtils.getBodyString(bodyBuffer);
            log.info("[TransferController][Info]the http post body is {}", body);
            //解析body并封装至map
            map = jsonGetDataService.parseData(body, map);
            Map dataBaseMap = referenceService.dbPoolSelect(map);
            String taskMask =  (String) dataBaseMap.get("taskMask");
            float offset = (float) dataBaseMap.get("Offset");
            int data = (int) map.get("data");
            float actualData = (float)data/100;
            //更新京能数据库
            jnDbService.upload(taskMask, actualData, offset);
        } catch (IOException e) {
            log.error("[TransferController][Exception]parsing request error,the exception is {}", e.toString());
        } catch (Exception e1) {
            log.error("[TransferController][Exception]uploading jnDb error, the exception is {}", e1.toString());
        }
        return "Transfer OK";
    }
}
