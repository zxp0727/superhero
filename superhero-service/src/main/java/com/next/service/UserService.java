package com.next.service;

import com.next.pojo.Users;
import com.next.pojo.bo.UserBO;
import com.next.pojo.bo.WXUserBO;

public interface UserService {

    /**
     * 保存微信注册的用户信息
     * @param openId
     * @param wxUserBO
     * @return
     */
    Users saveUsersForWeChat(String openId, WXUserBO wxUserBO);

    /**
     * 根据微信openId查询用户信息
     * @param oendId
     * @return
     */
    Users queryUsersByOpenId(String oendId);

    /**
     * 根据用户名判断用户名是否存在
     * @param username
     * @return
     */
    Boolean queryUserByUsernameIsExist(String username);

    /**
     * 根据用户名和密码查询用户信息
     * @param username
     * @param password
     * @return
     */
    Users queryUserByUsernameAndPassword(String username, String password);

    /**
     * 用户注册
     * @param userBO
     * @return
     */
    Users saveUser(UserBO userBO);

    /**
     * 修改用户对象信息
     * @param users
     * @return
     */
    Users updateUser(Users users);
}
