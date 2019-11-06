package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import com.next.comm.AppResponse;
import com.next.service.CarouselService;
import com.next.service.MovieService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/index")
@Api(value = "首页", tags = {"首页展示相关接口"})
public class IndexController extends BasicController {

    @Autowired
    private CarouselService carouselService;

    @Autowired
    private MovieService movieService;

    @ApiOperation(value = "获取首页轮播图列表")
    @PostMapping("/carousel/list")
    public AppResponse queryAllCarousel(){
        return AppResponse.success("ok",carouselService.queryAll());
    }

    @ApiOperation(value = "热门超英/热门预告")
    @PostMapping("/movie/hot")
    public AppResponse queryHotMovie(
            @ApiParam(name = "type", value = "[超英(superhero)/预告(trailer)]", required = true)
            @RequestParam String type){
        if(StringUtils.isEmpty(type)){
            return AppResponse.error("参数类型不能为空");
        }
        return AppResponse.success("ok",movieService.queryHotMovieByType(type));
    }

    @PostMapping("/guessULike")
    public AppResponse guessULike(){
        //1.查询所有记录预告记录数
        int counts = movieService.queryAllTrailerCounts();
        return AppResponse.success(guessULikeIndex(counts));
    }

}
