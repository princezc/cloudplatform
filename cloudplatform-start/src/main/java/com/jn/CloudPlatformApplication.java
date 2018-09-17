package com.jn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @ClassName com.jn.CloudPlatformApplication
 * @Author zhengcheng
 * @Date 2018/9/13 20:33
 **/
@SpringBootApplication
public class CloudPlatformApplication /*extends SpringBootServletInitializer*/ {

/*    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(CloudPlatformApplication.class);
    }*/

    public static void main(String[] args) {
        SpringApplication.run(CloudPlatformApplication.class, args);
    }
}
