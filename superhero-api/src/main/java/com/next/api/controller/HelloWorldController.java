package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

@RestController
@ApiIgnore
public class HelloWorldController extends BasicController {

    @GetMapping("/hello")
    public Object hello(){
        return "hello world";
    }

    @GetMapping("/set")
    public Object set(){
        redis.set("hello_redis","redis hello");
        return "success";
    }

    @GetMapping("/get")
    public Object get(){
        return redis.get("hello_redis");
    }
}

