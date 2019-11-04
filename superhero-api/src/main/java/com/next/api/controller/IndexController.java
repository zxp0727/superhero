package com.next.api.controller;

import com.next.service.CarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private CarouselService carouselService;

    @RequestMapping("/carousel/list")
    public Object queryAllCarousel(){
        return carouselService.queryAll();
    }

}
