package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import com.next.constant.CommobConstant;
import com.next.pojo.Users;
import com.next.pojo.bo.WXSessionBO;
import com.next.pojo.bo.WXUserBO;
import com.next.pojo.vo.UserVO;
import com.next.service.UserService;
import com.next.utils.AppResponse;
import com.next.utils.HttpClientUtil;
import com.next.utils.JsonUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/stu")
@Api(value = "微信注册登录", tags = {"微信注册登录接口"})
public class MPWeChatRegistryController extends BasicController {

    @Value("${weChat.app_id}")
    private String appId;
    @Value("${weChat.secret_key}")
    private String secretKey;

    @Autowired
    private UserService userService;

    @ApiOperation(value = "微信注册登录", notes = "微信注册登录", httpMethod = "POST")
    @PostMapping("/mpWXLogin/{code}")
    public AppResponse mpWeChatLogin(
            @ApiParam(name = "code", value = "微信返回的js_code", required = true)
            @PathVariable String code,
            @ApiParam(name = "wxUserBO", value = "微信小程序用户对象", required = true)
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
        if(wxSessionBO.getErrcode() != null && wxSessionBO.getErrcode() != 0){
            return AppResponse.error(wxSessionBO.getErrmsg());
        }

        Users users = userService.queryUsersByOpenId(wxSessionBO.getOpenid());
        if(users == null){
            users = userService.saveUsersForWeChat(wxSessionBO.getOpenid(), wxUserBO);
        }

        //设置一个分布式sessionid
        String usersId = users.getId();
        String tokenId = UUID.randomUUID().toString().trim();
        redis.set(CommobConstant.REDIS_USER_TOKEN+usersId,tokenId);

        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(users,userVO);
        userVO.setUserUniqueToken(tokenId);

        return AppResponse.success(userVO);
    }
}
