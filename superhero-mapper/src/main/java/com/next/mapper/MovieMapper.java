package com.next.mapper;

import com.next.my.mapper.MyMapper;
import com.next.pojo.Movie;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieMapper extends MyMapper<Movie> {
}