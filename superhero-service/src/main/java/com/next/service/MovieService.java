package com.next.service;

import com.next.pojo.Movie;

import java.util.List;

public interface MovieService {

    /**
     * 热门超英或热门预告查询接口
     * @param type  查询类型
     * @return
     */
    List<Movie> queryHotMovieByType(String type);

    /**
     * 查询所有的电影预告记录
     * @return
     */
    int queryAllTrailerCounts();

    /**
     * 查询所有电影记录预告片
     * @return
     */
    List<Movie> queryAllMovieTrailer();
}
