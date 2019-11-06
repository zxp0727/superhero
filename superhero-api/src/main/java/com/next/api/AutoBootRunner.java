package com.next.api;

import com.next.constant.CommobConstant;
import com.next.pojo.Movie;
import com.next.redis.RedisOperator;
import com.next.service.MovieService;
import com.next.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.cache.CacheProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AutoBootRunner implements ApplicationRunner {

    @Autowired
    private MovieService movieService;

    @Autowired
    private RedisOperator redis;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        initMovieRecordsToRedis();

    }

    public void initMovieRecordsToRedis(){
        //查询所有记录
        List<Movie> movies = movieService.queryAllMovieTrailer();
        for (int i = 0; i < movies.size(); i++){
            redis.set(CommobConstant.GUESS_MOVIE_KEY + i, JsonUtils.objectToJson(movies.get(i)));
        }
    }
}
