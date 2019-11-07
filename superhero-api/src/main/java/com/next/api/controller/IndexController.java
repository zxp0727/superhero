package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import com.next.constant.CommobConstant;
import com.next.pojo.Movie;
import com.next.utils.AppResponse;
import com.next.service.CarouselService;
import com.next.service.MovieService;
import com.next.utils.JsonUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/index")
@Api(value = "首页", tags = {"首页展示相关接口"})
public class IndexController extends BasicController {

    @Autowired
    private CarouselService carouselService;

    @Autowired
    private MovieService movieService;

    @ApiOperation(value = "获取首页轮播图列表", notes = "获取首页轮播图列表", httpMethod = "POST")
    @PostMapping("/carousel/list")
    public AppResponse queryAllCarousel(){
        return AppResponse.success("ok",carouselService.queryAll());
    }

    @ApiOperation(value = "热门超英/热门预告", notes = "热门超英/热门预告", httpMethod = "POST")
    @PostMapping("/movie/hot")
    public AppResponse queryHotMovie(
            @ApiParam(name = "type", value = "[超英(superhero)/预告(trailer)]", required = true)
            @RequestParam String type){
        if(StringUtils.isEmpty(type)){
            return AppResponse.error("参数类型不能为空");
        }
        return AppResponse.success("ok",movieService.queryHotMovieByType(type));
    }

    @ApiOperation(value = "猜你喜欢", notes = "猜你喜欢", httpMethod = "POST")
    @PostMapping("/guessULike")
    public AppResponse guessULike(){
        //1.查询所有记录预告记录数
        int counts = movieService.queryAllTrailerCounts();
        //构建一个在记录数范围内的随机数组成的固定长度的数组
        int[] guessULikeIndex = guessULikeIndex(counts);
        List<Movie> movies = new ArrayList<>();
        //从初始化redis中获取对应的movie信息
        for (int i = 0; i < guessULikeIndex.length; i++){
            movies.add(JsonUtils.jsonToPojo(redis.get(CommobConstant.GUESS_MOVIE_KEY+guessULikeIndex[i]),Movie.class));
        }
        return AppResponse.success(movies);
    }

}
