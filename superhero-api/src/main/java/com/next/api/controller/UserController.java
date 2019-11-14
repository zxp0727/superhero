package com.next.api.controller;

import com.next.api.config.FileConfig;
import com.next.api.controller.basic.BasicController;
import com.next.constant.CommonConstant;
import com.next.pojo.Users;
import com.next.pojo.bo.ModifyUserBO;
import com.next.pojo.bo.UserBO;
import com.next.service.UserService;
import com.next.utils.AppResponse;
import com.next.utils.DateUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.Cleanup;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;

@RestController
@RequestMapping("/user")
@Api(value = "用户", tags = {"用户相关接口"})
public class UserController extends BasicController {

    @Autowired
    private UserService userService;

    @Autowired
    private FileConfig fileConfig;

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

    @ApiOperation(value = "头像上传", notes = "头像上传", httpMethod = "POST")
    @PostMapping(value = "/uploadFace", headers = "content-type=multipart/form-data")
    public AppResponse uploadFace(
            @ApiParam(name = "userId", value = "用户id主键", required = true)
            @RequestParam String userId,
            @ApiParam(name = "file", value = "上次头像文件", required = true)
            MultipartFile file){




        String faceFileSpace = fileConfig.getFaceFileSpace();
        String uploadPathPrefix = File.separator+userId;
        if(file != null){
            //获取文件上传时的名称
            String filename = file.getOriginalFilename();
            //重新生成文件名称
            if(StringUtils.isNotEmpty(filename)){
                String[] split = filename.split("\\.");
                String suffix = split[split.length-1];

                String newFileName = "face-"+userId+"."+suffix;




                String finalFilePath = faceFileSpace +
                                            uploadPathPrefix +
                                            File.separator +
                                            newFileName;

                uploadPathPrefix += (File.separator+newFileName);

                File outFace = new File(finalFilePath);
                if (outFace.getParentFile() != null || !outFace.getParentFile().isDirectory()) {
                    outFace.getParentFile().mkdirs();
                }

                try {
                    @Cleanup FileOutputStream fileOutputStream = new FileOutputStream(outFace);
                    @Cleanup InputStream inputStream = file.getInputStream();
                    //fileOutputStream = new FileOutputStream(outFace);
                    //inputStream = file.getInputStream();
                    IOUtils.copy(inputStream, fileOutputStream);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        // 针对用户新头像，保存到数据库
        String newUserFaceUrl = fileConfig.getUrl() + uploadPathPrefix;
        // 为了保证前端每次上传拿到的图片地址都是最新的，并且是需要刷新的
        newUserFaceUrl += ("?t=" + DateUtil.getCurrentDateString(DateUtil.DATE_PATTERN));

        //windows路径要进行\转换
        newUserFaceUrl = newUserFaceUrl.replace("\\","/");
        //保存到数据库
        Users users = new Users();
        users.setFaceImage(newUserFaceUrl);
        users.setId(userId);
        users =userService.updateUser(users);
        //置空密码
        users.setPassword(null);
        return AppResponse.success(setUserVOToken(users));
    }

    @ApiOperation(value = "修改用户信息", notes = "修改用户信息", httpMethod = "POST")
    @PostMapping("/modifyUserinfo")
    public AppResponse modifyUserinfo(@RequestBody ModifyUserBO userBO){
        String msg = checkParams(userBO);
        if(StringUtils.isNotEmpty(msg)){
            return AppResponse.error(msg);
        }
        Users users = new Users();
        BeanUtils.copyProperties(userBO,users);
        users.setId(userBO.getUserId());
        Users updateUser = userService.updateUser(users);
        updateUser.setPassword(null);
        return AppResponse.success(setUserVOToken(updateUser));
    }

    private String checkParams(ModifyUserBO userBO){
        String msg = "";
        String userId = userBO.getUserId();
        if(StringUtils.isEmpty(userId)){
            msg = "用户ID不能为空！";
        }
        String birthday = userBO.getBirthday();
        String nickname = userBO.getNickname();
        Integer sex = userBO.getSex();
        if(StringUtils.isEmpty(birthday) && StringUtils.isEmpty(nickname) && sex == null){
            msg = "修改的用户信息不能为全部为空！";
        }
        if(sex != null && sex != 1 && sex != 0){
            msg = "性别格式不正确 - [1:男][0:女]";
        }
        if(StringUtils.isNotEmpty(nickname) && nickname.length() > 12){
            msg = "用户昵称长度不能超过12！";
        }
        if(StringUtils.isNotEmpty(birthday)){
            if(!DateUtil.isValidDate(birthday,"yyyy-MM-dd")){
                msg = "用户生日格式不正常 - [1990-01-01]";
            }
        }
        return msg;
    }
}
