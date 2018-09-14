package com.jn.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

/**
 * @ClassName ChinaTelecomPlatformServiceImpl
 * @Author zhengcheng
 * @Date 2018/9/14 16:41
 **/
@Slf4j
@Service
public class ChinaTelecomPlatformServiceImpl implements ChinaTelecomPlatformService{

    @Override
    public String sendLogInMessage(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        StringBuilder result = new StringBuilder();
        try {
            URL realUrl = new URL(url);
            URLConnection conn = realUrl.openConnection();

            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

            conn.setDoOutput(true);
            conn.setDoInput(true);

            out = new PrintWriter(conn.getOutputStream());
            out.print(param);
            out.flush();
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result.append(line);
            }
        } catch (Exception e) {
            log.error("[ChinaTelecomPlatformServiceImpl][Exception] Exception is {}", e.toString());
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException e1) {
                log.error("[ChinaTelecomPlatformServiceImpl][Exception] Exception is happend while the stream is closing ,it's {}", e1.toString());
            }
        }
        return result.toString();
    }
}
