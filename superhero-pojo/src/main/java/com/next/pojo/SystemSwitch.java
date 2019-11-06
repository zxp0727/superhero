package com.next.pojo;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "system_switch")
public class SystemSwitch {
    @Column(name = "is_show_video")
    private Integer isShowVideo;

    @Column(name = "app_weixin_login")
    private Integer appWeixinLogin;

    @Column(name = "app_qq_login")
    private Integer appQqLogin;

    @Column(name = "app_weibo_login")
    private Integer appWeiboLogin;

    @Column(name = "mp_weixin_login")
    private Integer mpWeixinLogin;

    /**
     * @return is_show_video
     */
    public Integer getIsShowVideo() {
        return isShowVideo;
    }

    /**
     * @param isShowVideo
     */
    public void setIsShowVideo(Integer isShowVideo) {
        this.isShowVideo = isShowVideo;
    }

    /**
     * @return app_weixin_login
     */
    public Integer getAppWeixinLogin() {
        return appWeixinLogin;
    }

    /**
     * @param appWeixinLogin
     */
    public void setAppWeixinLogin(Integer appWeixinLogin) {
        this.appWeixinLogin = appWeixinLogin;
    }

    /**
     * @return app_qq_login
     */
    public Integer getAppQqLogin() {
        return appQqLogin;
    }

    /**
     * @param appQqLogin
     */
    public void setAppQqLogin(Integer appQqLogin) {
        this.appQqLogin = appQqLogin;
    }

    /**
     * @return app_weibo_login
     */
    public Integer getAppWeiboLogin() {
        return appWeiboLogin;
    }

    /**
     * @param appWeiboLogin
     */
    public void setAppWeiboLogin(Integer appWeiboLogin) {
        this.appWeiboLogin = appWeiboLogin;
    }

    /**
     * @return mp_weixin_login
     */
    public Integer getMpWeixinLogin() {
        return mpWeixinLogin;
    }

    /**
     * @param mpWeixinLogin
     */
    public void setMpWeixinLogin(Integer mpWeixinLogin) {
        this.mpWeixinLogin = mpWeixinLogin;
    }
}