package com.jn.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.util.Map;

/**Json解析工具方法
 * @ClassName JsonGetDataUtils
 * @Author zhengcheng
 * @Date 2018/9/14 16:22
 **/
@Slf4j
public class JsonGetDataUtils {

    public static Map getData(String json, Map map) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode node = mapper.readTree(json);
            //获取deviceId
            JsonNode deviceIdInJson = node.findValue("deviceId");
            String deviceIdInString  = deviceIdInJson.textValue();
            System.out.println(deviceIdInString);
            map.put("deviceId",deviceIdInString);
            //获取service子Json串
            JsonNode notifyType = node.get("service");
            log.info("NotifyType is {}", notifyType);
            //获取serviceId
            JsonNode serviceIdInJson = notifyType.findValue("serviceId");
            String serviceIdInString  = serviceIdInJson.textValue();
            log.info("ServiceId is {}", serviceIdInString);
            map.put("serviceId",serviceIdInString);
            //获取serviceType
            JsonNode serviceTypeInJson = notifyType.findValue("serviceType");
            String serviceTypeInString  = serviceTypeInJson.textValue();
            log.info("ServiceType is {}", serviceTypeInString);
            map.put("serviceType",serviceTypeInString);
            //获取实际数据
            JsonNode dataIdInJson = notifyType.findValue("data");
            JsonNode Jsondata = dataIdInJson.findValue(serviceTypeInString);
            int data = Jsondata.asInt();
            log.info("Data is {}", data);
            map.put("data", data);
            if(serviceTypeInString.equals("shock") && data==0){
                AlertUtils.sendAlertMessage(deviceIdInString);
            }
            return map;
        } catch (IOException e) {
            log.error("[JsonGetData][Exception] exception is {}", e.toString());
            return null;
        }

    }
}
