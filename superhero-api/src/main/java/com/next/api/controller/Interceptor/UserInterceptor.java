package com.next.api.controller.Interceptor;

import com.next.constant.CommonConstant;
import com.next.redis.RedisOperator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 用户相关接口拦截器
 */
public class UserInterceptor implements HandlerInterceptor {

    @Autowired
    public RedisOperator redis;

    /**
     * 请求前进行拦截
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //从请求头中拿到前端缓存的用户id和token
        String userId = request.getHeader("headerUserId");
        String userToken = request.getHeader("headerUserToken");
        if(StringUtils.isNotEmpty(userId)&&StringUtils.isNotEmpty(userToken)){
            String token = redis.get(CommonConstant.REDIS_USER_TOKEN + userId);
            if(token == null){
                System.out.println("登录已过期，请重新登录。。。");
                return false;
            }
            if(!token.equals(userToken)){
                System.out.println("异地登录，请确认账号信息。。。");
                return false;
            }
            return true;
        }else{
            System.out.println("请登录。。。");
            return false;
        }
    }

    /**
     * 请求后渲染前进行渲染
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 请求结束，渲染后进行拦截
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
