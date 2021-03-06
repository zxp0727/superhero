package com.next.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.next.constant.MovieTypeEnum;
import com.next.mapper.MovieMapper;
import com.next.pojo.Movie;
import com.next.service.MovieService;
import com.next.utils.JqGridResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieMapper movieMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
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

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public int queryAllTrailerCounts() {
        return movieMapper.selectCount(new Movie());
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Movie> queryAllMovieTrailer() {
        return movieMapper.selectAll();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public JqGridResult queryMovieByKeyWordForPage(String keyWord, int page, int pageSize) {
        Example example = new Example(Movie.class);
        example.orderBy("createTime");

        Example.Criteria criteria = example.createCriteria();
        criteria.orLike("name", "%"+keyWord+"%");
        criteria.orLike("originalName", "%"+keyWord+"%");

        PageHelper.startPage(page,pageSize);

        List<Movie> movies = movieMapper.selectByExample(example);

        PageInfo<Movie> pageInfo = new PageInfo<>(movies);
        JqGridResult jqGridResult = new JqGridResult();
        jqGridResult.setPage(page);
        jqGridResult.setRecords(pageInfo.getTotal());
        jqGridResult.setRows(movies);
        jqGridResult.setTotal(pageInfo.getPages());
        return jqGridResult;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Movie getMovieByTrailerId(String trailerId) {
        return movieMapper.selectByPrimaryKey(trailerId);
    }
}
