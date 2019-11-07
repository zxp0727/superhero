package com.next.service;

import com.next.pojo.Users;
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
}
