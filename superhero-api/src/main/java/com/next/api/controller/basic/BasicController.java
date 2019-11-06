package com.next.api.controller.basic;

import com.next.redis.RedisOperator;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BasicController {

    @Autowired
    public RedisOperator redis;

    /**
     * 组装一个长度为5的数组，数组内容为count以内随机数，不重复
     * @param count
     * @return
     */
    protected int[]  guessULikeIndex(int count){
        int[] guessULikeArray = new int[5];
        for (int i = 0; i < guessULikeArray.length; i++){
            int index = (int) (Math.random()*count);
            if(ArrayUtils.contains(guessULikeArray,index)){
                i--;
                continue;
            }
            guessULikeArray[i] = index;
        }
        return guessULikeArray;
    }
}
