package com.next.service.impl;

import com.next.mapper.UsersMapper;
import com.next.pojo.Users;
import com.next.pojo.bo.WXUserBO;
import com.next.service.UserService;
import org.n3r.idworker.Sid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private Sid sid;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public Users saveUsersForWeChat(String openId, WXUserBO wxUserBO) {
        //使用idworker生成全局唯一id
        String nextShort = sid.nextShort();
        Users user = new Users();
        user.setId(nextShort);
        user.setFaceImage(wxUserBO.getAvatarUrl());
        user.setMpWxOpenId(openId);
        user.setNickname(wxUserBO.getNickName());

        user.setIsCertified(0);
        user.setRegistTime(new Date());

        usersMapper.insert(user);
        return user;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Users queryUsersByOpenId(String oendId) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("mpWxOpenId", oendId);
        return usersMapper.selectOneByExample(example);
    }
}
