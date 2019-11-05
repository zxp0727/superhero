package com.next.api;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * swagger2配置类
 */
@Configuration
@EnableSwagger2
public class Swagger2 {

    /**
     * 构建swagger配置类，配置swagger的一些基本配置
     * http://[ip]:[port]/[prjName]/swagger-ui.html
     * http://[ip]:[port]/[prjName]/doc.html
     * @return
     */
    @Bean
    public Docket createRestApi(){
        return new Docket(DocumentationType.SWAGGER_2)
                //api基本信息
                .apiInfo(createApiInfo())
                //获取构造器
                .select()
                //api扫描路径
                .apis(RequestHandlerSelectors.basePackage("com.next.api.controller"))
                //路径选择
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * api基本信息
     * @return
     */
    private ApiInfo createApiInfo(){
        return new ApiInfoBuilder()
                //文档标题
                .title("电影预告小程序")
                //联系方式，姓名，链接，邮箱
                .contact(new Contact("tom","www.qq.com","tom@qq.com"))
                .description("电影预告小程序接口文档描述信息")
                .version("1.0.1")
                .termsOfServiceUrl("www.qq.com")
                .build();
    }
}
