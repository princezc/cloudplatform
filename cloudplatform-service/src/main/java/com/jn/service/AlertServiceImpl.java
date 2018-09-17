package com.jn.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jn.dao.AlertDAO;
import com.jn.dao.ReferenceDAO;
import com.jn.domain.AlertDO;
import com.jn.domain.ReferenceDO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName AlertServiceImpl
 * @Author zhengcheng
 * @Date 2018/9/16 15:53
 **/
@Slf4j
@Service
public class AlertServiceImpl implements AlertService{

    @Autowired
    private AlertDAO alertDAO;

    @Autowired
    private ReferenceDAO referenceDAO;

    @Value("${weixin.url}")
    private String weixinUrl;

    @Value("${weixin.param}")
    private String weixinParam;

    @Value("${weixin.message.url}")
    private String weixinMessageUrl;

    @Override
    public Boolean isAlert(String deviceId) {
        List<AlertDO> alertDOList = alertDAO.selectAlertById(deviceId);
        if (alertDOList == null || alertDOList.size() == 0) {
            return false;
        }
        return true;
    }

    @Override
    public void doAlert(String deviceId) {
        if (isAlert(deviceId)) {
            log.warn("[AlertServiceImpl][Warn]start alert, the deviceId is {}", deviceId);
            List<ReferenceDO> referenceDOList = referenceDAO.selectReferenceById(deviceId);
            for (ReferenceDO referenceDO : referenceDOList) {
                log.warn("[AlertServiceImpl][Warn]referenceDO is {}", referenceDO.toString());
                String alertMessage = "标签掩码" + referenceDO.getDbRName() + "\n设备Id:" + deviceId + "\n设备描述:" + referenceDO.getDescription() + "\n出现异常状况,请处理";
                sendAlertMessage(alertMessage);
                AlertDO alertDO = new AlertDO();
                alertDO.setDeviceId(deviceId);
                alertDO.setDeviceState("待处理");
                alertDO.setDescription(referenceDO.getDescription());
                alertDO.setOperator("无附加操作");
                alertDO.setTagMask(referenceDO.getDbRName());
                Integer result = alertDAO.insertAlert(alertDO);
                log.info("[AlertServiceImpl][Warn]alert operation is success");
            }
        } else {
            log.warn("[AlertServiceImpl][Warn]the alert data already exists");
        }
    }

    private void sendAlertMessage(String message) {
        //发送get至微信平台，获取accessToken
        log.info("[AlertServiceImpl][Info]start sending request to weixin platform");
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        HttpEntity<String> requestEntity = new HttpEntity<>(null, headers);
        ResponseEntity<String> response = null;
        try {
            response = restTemplate.exchange(weixinUrl + "?" + weixinParam, HttpMethod.GET, requestEntity, String.class);
        } catch (RestClientException e) {
            log.error("[AlertServiceImpl][Exception]sending request to weixin platform error, the exception is {}", e.toString());
        }
        log.info("[AlertServiceImpl][Info]response from weixin platform is {}", response);

        ObjectMapper objectMapper = new ObjectMapper();
        String wxMsgUrl = weixinMessageUrl;
        try {
            JsonNode rootNode = objectMapper.readTree(response.getBody());
            String accessToken = rootNode.path("access_token").asText();
            log.info("[AlertServiceImpl][Info]access_token from weixin platform is {}", accessToken);
            wxMsgUrl += accessToken;
        } catch (IOException e) {
            log.error("[AlertServiceImpl][Exception]parsing response from weixin platform error, the exception is {}", e.toString());
        }

        //将message发送至微信平台
        log.info("[AlertServiceImpl][Info]start sending post request to weixin platform");
        restTemplate = new RestTemplate();
        headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
        String body = "{ \"touser\"  : \"@all\", \"msgtype\" : \"text\", \"agentid\" : 1000002, \"text\" : { \"content\" :\" "+ message + "\"},\"safe\":0 }";
        HttpEntity<String> httpEntity = new HttpEntity<>(body, headers);
        response = null;
        try {
            response = restTemplate.exchange(wxMsgUrl, HttpMethod.POST, httpEntity, String.class);
        } catch (RestClientException e) {
            log.error("[AlertServiceImpl][Exception]sending post request to weixin platform error, the exception is {}", e.toString());
        }
        Integer responseCode = response.getStatusCodeValue();
        if (responseCode != null && responseCode == HttpURLConnection.HTTP_OK) {
            log.info("[AlertServiceImpl][Info]sending post request to weixin platform successful, the responseBody is {}", response.getBody());
        } else {
            log.error("[AlertServiceImpl][Error]sending post request to weixin platform error, the response is {}", response.toString());
        }
    }
}
