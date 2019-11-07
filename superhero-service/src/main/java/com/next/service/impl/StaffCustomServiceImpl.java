package com.next.service.impl;

import com.next.mapper.StaffCustomMapper;
import com.next.pojo.vo.StaffVO;
import com.next.service.StaffCustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StaffCustomServiceImpl implements StaffCustomService {

    @Autowired
    private StaffCustomMapper staffCustomMapper;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<StaffVO> queryStaffByMovieIdAndRole(String movieId, Integer role) {
        return staffCustomMapper.queryStaffByMovieIdAndRole(movieId,role);
    }
}
