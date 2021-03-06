package com.next.service;

import com.next.pojo.vo.StaffVO;

import java.util.List;

/**
 * 演职人员自定义服务类
 */
public interface StaffCustomService {

    /**
     * 根据电影id和角色获取演职人员信息
     *
     * @param movieId
     * @param role
     * @return
     */
    List<StaffVO> queryStaffByMovieIdAndRole(String movieId, Integer role);
}
