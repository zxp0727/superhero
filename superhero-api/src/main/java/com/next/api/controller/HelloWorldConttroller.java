package com.next.api.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

@RestController
@ApiIgnore
public class HelloWorldConttroller {

    @RequestMapping("/hello")
    public Object hello(){
        return "hello world";
    }
}

