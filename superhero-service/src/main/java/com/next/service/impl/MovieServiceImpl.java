package com.next.service.impl;

import com.github.pagehelper.PageHelper;
import com.next.constant.MovieTypeEnum;
import com.next.mapper.MovieMapper;
import com.next.pojo.Movie;
import com.next.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieMapper movieMapper;

    @Override
    public List<Movie> queryHotMovieByType(String type) {

        //首页显示的时候，热门超英是根据评分从高到低展示前8条记录
        //热门预告是根据点赞数从高到低展示前4条
        //因此采用分页的方式，查询第一页，根据类型设置每页长度
        int page = 1;
        int pageSize;
        Example example = new Example(Movie.class);
        if(type.equals(MovieTypeEnum.SUPERHERO.getType())){
            //分数排序
            example.orderBy("score").desc();
            pageSize = 8;
        }else if(type.equals(MovieTypeEnum.TRAILER.getType())){
            example.orderBy("prisedCounts").desc();
            pageSize = 4;
        }else{
            return null;
        }
        //针对mybatis集成的分页插件
        PageHelper.startPage(page,pageSize);
        return movieMapper.selectByExample(example);
    }

    @Override
    public int queryAllTrailerCounts() {
        return movieMapper.selectCount(new Movie());
    }
}
