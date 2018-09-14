package com.jn.utils;

import lombok.extern.slf4j.Slf4j;

import java.io.BufferedReader;
import java.io.IOException;

/**
 * @ClassName HttpUtils
 * @Author zhengcheng
 * @Date 2018/9/14 16:34
 **/
@Slf4j
public class HttpUtils {

    public static String getBodyString(BufferedReader br) {
        String inputLine;
        String str = "";
        try {
            while ((inputLine = br.readLine()) != null) {
                str += inputLine;
            }
            br.close();
        } catch (IOException e) {
            log.error("[HttpUtils][Exception] Exception is {}", e.toString());
        }
        return str;
    }
}
