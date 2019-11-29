package com.next.api.controller.aop;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.next.pojo.vo.BaseVO;
import com.next.service.UserService;
import com.next.utils.AppResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Field;

@ControllerAdvice
public class MyAop implements ResponseBodyAdvice {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(MethodParameter returnType, Class converterType) {
        AnnotatedElement annotatedElement = returnType.getAnnotatedElement();
        AopPermission aopPermission = AnnotationUtils.findAnnotation(annotatedElement, AopPermission.class);
        return aopPermission != null;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType, Class selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        AnnotatedElement annotatedElement = returnType.getAnnotatedElement();
        AopPermission aopPermission = AnnotationUtils.findAnnotation(annotatedElement, AopPermission.class);

        //拿当前登录用户信息

        String[] properties = aopPermission.properties();
        System.out.println(properties);
        String hiddenPrefix = aopPermission.hiddenPrefix();
        System.out.println(hiddenPrefix);
        String showPreFix = aopPermission.showPreFix();
        System.out.println(showPreFix);
        boolean b = aopPermission.checkEdit();
        System.out.println(b);


        AppResponse appResponse = (AppResponse) body;
        Object data = appResponse.getData();
        Field[] declaredFields = data.getClass().getDeclaredFields();



        for (Field field : declaredFields){
            System.out.println(field.getName());
        }
        return appResponse;
    }
}
