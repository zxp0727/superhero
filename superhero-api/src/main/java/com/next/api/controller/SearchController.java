package com.next.api.controller;

import com.next.api.controller.basic.BasicController;
import com.next.service.MovieService;
import com.next.service.StaffCustomService;
import com.next.utils.AppResponse;
import com.next.utils.JqGridResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("search")
@Api(value = "搜索页", tags = {"搜索页相关接口"})
public class SearchController extends BasicController {

    @Autowired
    private MovieService movieService;

    @Autowired
    private StaffCustomService staffCustomService;

    @ApiOperation(value ="搜索电影列表", notes = "搜索电影列表", httpMethod = "POST")
    @PostMapping("/list")
    public AppResponse searchList(
            @ApiParam(name = "keywords", value = "电影名称（中文/英文）", required = false)
            @RequestParam String keywords,
            @ApiParam(name = "page", value = "分页当前页码", required = false)
            @RequestParam Integer page,
            @ApiParam(name = "pageSize", value = "分页每页数量", required = false)
            @RequestParam Integer pageSize){

        if(StringUtils.isEmpty(keywords)){
            keywords = "";
        }
        if(page == null){
            page = 1;
        }
        if(pageSize == null){
            pageSize = 9;
        }

        JqGridResult jqGridResult = movieService.queryMovieByKeyWordForPage(keywords, page, pageSize);

        return AppResponse.success(jqGridResult);
    }


    @ApiOperation(value ="查询电影详情", notes = "查询电影详情", httpMethod = "POST")
    @PostMapping("/trailer/{trailerId}")
    public AppResponse moiveInfo(
            @ApiParam(name = "trailerId", value = "电影主键", required = true)
            @PathVariable String trailerId){
        if(StringUtils.isEmpty(trailerId)){
            return AppResponse.error("trailerId can not be null");
        }
        return AppResponse.success(movieService.getMovieByTrailerId(trailerId));
    }



    @ApiOperation(value ="查询演职人员", notes = "查询演职人员", httpMethod = "POST")
    @PostMapping("/staff/{trailerId}/{role}")
    public AppResponse staffList(
            @ApiParam(name = "trailerId", value = "电影主键", required = true)
            @PathVariable String trailerId,
            @ApiParam(name = "role", value = "人员角色", required = true)
            @PathVariable Integer role
            ){
        if(StringUtils.isEmpty(trailerId) || role == null){
            return AppResponse.error("trailerId or role can not be null");
        }
        return AppResponse.success(staffCustomService.queryStaffByMovieIdAndRole(trailerId,role));
    }


}
