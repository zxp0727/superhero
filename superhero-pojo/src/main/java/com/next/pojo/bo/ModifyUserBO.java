package com.next.pojo.bo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@ApiModel(value="用户信息修改对象", description="从客户端，获取到用户信息修改数据封装在此entity中")
public class ModifyUserBO {

    @ApiModelProperty(value="用户id",name="userId",example="NEXT", required=true)
    private String userId;

    @ApiModelProperty(value="昵称",name="nickname",example="NEXT")
    private String nickname;

    @ApiModelProperty(value="生日",name="birthday",example="NEXT")
    private String birthday;

    @ApiModelProperty(value="性别",name="sex",example="NEXT")
    private Integer sex;
}
