package com.next.pojo.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class UserVO {
    private String id;

    private String username;

    private String password;

    private String nickname;

    private String mpWxOpenId;

    private String appQqOpenId;

    private String appWxOpenId;

    private String appWeiboUid;

    private Integer sex;

    private String birthday;

    private String faceImage;

    private Integer isCertified;

    private Date registTime;

    /**
     * 用户唯一令牌
     */
    private String userUniqueToken;
}
