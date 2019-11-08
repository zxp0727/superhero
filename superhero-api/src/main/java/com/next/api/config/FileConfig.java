package com.next.api.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@ConfigurationProperties(prefix = "com.next")
@PropertySource("classpath:fileFace.properties")
@Setter
@Getter
public class FileConfig {
    /**
     * 文件夹目录
     */
    private String faceFileSpace;
    /**
     * 上传路径
     */
    private String url;
}
