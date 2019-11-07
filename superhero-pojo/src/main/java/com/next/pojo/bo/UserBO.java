package com.next.pojo.bo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserBO {

    @ApiModelProperty(value="用户名",name="username",example="NEXT", required=true)
    private String username;
    @ApiModelProperty(value="密码",name="password",example="NEXT", required=true)
    private String password;
}
