package com.next.api;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * 静态资源目录进行映射
     * @param registry
     *
     * macos: file:/temp/
     * win:	  file:C:/temp/
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //所有的请求都会被映射
        registry.addResourceHandler("/**")
                //映射到Tomcat目录
                .addResourceLocations("file:D:/temp/")  //上传文件路径
                .addResourceLocations(("classpath:/META-INF/resources/"));  //swagger2相关的页面内容
    }
}
