package com.next.api.controller;

import com.next.api.config.FileConfig;
import com.next.api.controller.basic.BasicController;
import com.next.constant.CommonConstant;
import com.next.pojo.Users;
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
                    fileOutputStream = new FileOutputStream(outFace);
                    inputStream = file.getInputStream();
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
}
