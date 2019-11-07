package com.next.service.impl;

import com.next.mapper.UsersMapper;
import com.next.pojo.Users;
import com.next.pojo.bo.UserBO;
import com.next.pojo.bo.WXUserBO;
import com.next.service.UserService;
import com.next.utils.MD5Utils;
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

    private final static String USER_DEFAULT_FACE_IMAGE_URL = "http://122.152.205.72:88/group1/M00/00/05/CpoxxFw_8_qAIlFXAAAcIhVPdSg994.png";

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

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Boolean queryUserByUsernameIsExist(String username) {
        Users users = new Users();
        users.setUsername(username);
        Users record = usersMapper.selectOne(users);
        return record == null ? false : true;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Users queryUserByUsernameAndPassword(String username, String password) {
        Example example = new Example(Users.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", username);
        try {
            password = MD5Utils.getMD5Str(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        criteria.andEqualTo("password", password);
        return usersMapper.selectOneByExample(example);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public Users saveUser(UserBO userBO) {
        String nextShort = sid.nextShort();
        Users user = new Users();
        user.setId(nextShort);
        user.setUsername(userBO.getUsername());
        //md5加密
        try {
            user.setPassword(MD5Utils.getMD5Str(userBO.getPassword()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setNickname(userBO.getUsername());
        user.setFaceImage(USER_DEFAULT_FACE_IMAGE_URL);
        user.setIsCertified(0);
        user.setRegistTime(new Date());
        usersMapper.insert(user);
        return user;
    }


}
