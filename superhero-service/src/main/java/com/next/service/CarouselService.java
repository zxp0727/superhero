package com.next.service;

import com.next.pojo.Carousel;

import java.util.List;

public interface CarouselService {

    /**
     * 首页轮播图接口
     * @return
     */
    List<Carousel> queryAll();
}
