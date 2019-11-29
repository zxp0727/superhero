package com.next.api.controller.aop;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 修改时，用户权限校验
 * 查看时，默认隐藏属性
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
public @interface AopPermission {

    /**
     * 是否校验编辑权限
     * @return
     */
    boolean checkEdit() default true;

    /**
     * 需要处理的属性
     * @return
     */
    String[] properties() default {};

    /**
     * 隐藏字段前缀
     * @return
     */
    String hiddenPrefix() default "hidden";

    /**
     * 显示字段对应前缀
     * @return
     */
    String showPreFix() default "show";

}
