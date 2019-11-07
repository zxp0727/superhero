package com.next.pojo.bo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class WXSessionBO {

    private String openid;

    private String session_key;

    private String unionid;

    private Integer errcode;

    private String errmsg;
}
