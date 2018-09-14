import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @ClassName CloudPlatformApplication
 * @Author zhengcheng
 * @Date 2018/9/13 20:33
 **/
@SpringBootApplication
@Slf4j
public class CloudPlatformApplication {
    public static void main(String[] args) {
        log.info("start");
        SpringApplication.run(CloudPlatformApplication.class, args);
    }
}
