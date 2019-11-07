package com.next.api.controller;

import com.next.pojo.Users;
import com.next.pojo.bo.WXSessionBO;
import com.next.pojo.bo.WXUserBO;
import com.next.service.UserService;
import com.next.utils.AppResponse;
import com.next.utils.HttpClientUtil;
import com.next.utils.JsonUtils;
import jdk.nashorn.internal.objects.annotations.Property;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("stu")
public class MPWeChatRegistryController {

    @Value("${weChat.app_id}")
    private String appId;
    @Value("${weChat.secret_key}")
    private String secretKey;

    @Autowired
    private UserService userService;

    @PostMapping("/maWXLogin/{code}")
    public AppResponse mpWeChatLogin(
            @PathVariable String code,
            @RequestBody WXUserBO wxUserBO
            ){
        if(StringUtils.isEmpty(code)){
            return AppResponse.error("code can not be null");
        }
        String url = "https://api.weixin.qq.com/sns/jscode2session?";
        Map<String,String> params = new HashMap<>();
        params.put("appid",appId);
        params.put("secret",secretKey);
        params.put("js_code",code);
        params.put("grant_type","authorization_code");
        String result = HttpClientUtil.doGet(url,params);
        WXSessionBO wxSessionBO = JsonUtils.jsonToPojo(result, WXSessionBO.class);
        if(wxSessionBO.getErrcode() != 0){
            return AppResponse.error(wxSessionBO.getErrmsg());
        }

        Users users = userService.queryUsersByOpenId(wxSessionBO.getOpenId());
        if(users == null){
            users = userService.saveUsersForWeChat(wxSessionBO.getOpenId(), wxUserBO);
        }

        return AppResponse.success(users);
    }
}
