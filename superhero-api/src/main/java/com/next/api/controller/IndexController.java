package com.next.api.controller;

import com.next.comm.AppResponse;
import com.next.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private CarouselService carouselService;

    @PostMapping("/carousel/list")
    public AppResponse queryAllCarousel(){
        return AppResponse.success("ok",carouselService.queryAll());
    }

}
