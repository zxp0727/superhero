package com.next.service;

import com.next.pojo.Movie;
import com.next.utils.JqGridResult;

import java.util.List;

/**
 * 电影预告服务接口
 */
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

    /**
     * 根据关键模糊查询电影信息，分页展示
     * @param keyWord
     * @param page
     * @param pageSize
     * @return
     */
    JqGridResult queryMovieByKeyWordForPage(String keyWord, int page, int pageSize);

    /**
     * 根据电影主键获取电影信息
     * @param trailerId
     * @return
     */
    Movie getMovieByTrailerId(String trailerId);
}
