package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import com.next.constant.CommonConstant;
import com.next.pojo.Users;
import com.next.pojo.bo.UserBO;
import com.next.service.UserService;
import com.next.utils.AppResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@Api(value = "用户", tags = {"用户相关接口"})
public class UserController extends BasicController {

    @Autowired
    private UserService userService;

    @ApiOperation(value = "用户登录", notes = "用户登录", httpMethod = "POST")
    @PostMapping("/registOrLogin")
    public AppResponse registOrLogin(
            @RequestBody UserBO userBO){
        if(StringUtils.isEmpty(userBO.getUsername()) || StringUtils.isEmpty(userBO.getPassword())){
            AppResponse.error("用户名或密码不能为空！");
        }
        Users users = null;
        if(userService.queryUserByUsernameIsExist(userBO.getUsername())){
            //存在查询出来登录
            users = userService.queryUserByUsernameAndPassword(userBO.getUsername(), userBO.getPassword());
        }else{
            //不存在注册
            users = userService.saveUser(userBO);
        }
        return AppResponse.success(creatSession(users));
    }

    @ApiOperation(value = "用户退出登录", notes = "用户退出登录", httpMethod = "POST")
    @PostMapping("/logout")
    public AppResponse logout(
            @ApiParam(name = "userId", value = "用户id主键", required = true)
            @RequestParam String userId){
        redis.del(CommonConstant.REDIS_USER_TOKEN+userId);
        return AppResponse.success();
    }
}
