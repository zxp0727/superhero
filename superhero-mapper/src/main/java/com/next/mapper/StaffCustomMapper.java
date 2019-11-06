package com.next.mapper;

import com.next.my.mapper.MyMapper;
import com.next.pojo.Staff;
import com.next.pojo.vo.StaffVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StaffCustomMapper extends MyMapper<Staff> {

    /**
     * 根据电影id和角色获取演职人员信息
     * @param movieId
     * @param role
     * @return
     */
    List<StaffVO> queryStaffByMovieIdAndRole(
            @Param(value = "movieId") String movieId,
            @Param(value = "role") Integer role);
}