package com.rainsoft.module.job.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.module.job.entity.ScheduleJobEntity;
import com.rainsoft.module.job.service.ScheduleJobService;
import com.rainsoft.util.Function;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 *scheduleJob管理
 * @付为地
 * @date 2018-01-14 03:06:31
 */
@Controller
@RequestMapping("/scheduleJob")
@Api(tags = "定时任务管理",description = "定时任务信息管理")
public class ScheduleJobController extends BaseController{
  

    @Autowired
	private ScheduleJobService scheduleJobService;

    /**
	 * 页面初始化
	 */
	@ApiOperation(value = "定时任务列表",notes = "进入定时任务列表页", httpMethod = "GET")
	@RequestMapping(value = "init",method = RequestMethod.GET)
	public String init(){
		return "scheduleJob/selectScheduleJob";
	}
	
    /**
	 * 分页查询数据
	 */
	@RequestMapping(value="/selectPage",method=RequestMethod.POST)
	@ResponseBody
	@Function("定时任务分页")
	@ApiOperation(value = "定时任务分页列表", notes = "定时任务分页列表", httpMethod = "POST",response = Map.class)
	public Map<String, Object> selectPage(@RequestBody ScheduleJobEntity entity){
		return responseSelectPage(scheduleJobService.selectPage(entity));
	}
	
	/**
	 * 跳转添加
	*/
    @RequestMapping(value="/preInsert",method=RequestMethod.GET)
    @ApiOperation(value = "跳转定时任务添加", notes = "进入定时任务添加页面", httpMethod = "GET")
	public String preInsert(HttpServletRequest req){
		return "scheduleJob/insertScheduleJob";
	} 
	
    /**
     * 添加数据
     */
	@RequestMapping(value="/insert",method=RequestMethod.PUT)
	@ResponseBody
	@Function("定时任务添加")
	@ApiOperation(value = "定时任务添加", notes = "创建定时任务", httpMethod = "POST",response = Boolean.class)
	public Boolean insert(@ApiParam(name = "定时任务对象", value = "传入json格式", required = true)  @RequestBody ScheduleJobEntity entity) {
		 scheduleJobService.save(entity);
		 return Boolean.TRUE;
	}
	
	/**
	 * 跳转更新
	*/
    @RequestMapping(value="/preUpdate",method=RequestMethod.GET)
    @ApiOperation(value = "跳转定时任务更新", notes = "进入定时任务更新页面", httpMethod = "GET")
	public String preUpdate(HttpServletRequest request){
	    request.setAttribute("scheduleJob", scheduleJobService.queryObject(Long.parseLong(request.getParameter("jobId"))));
		return "scheduleJob/updateScheduleJob";
	} 
	
    /**
     * 更新数据
     */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	@Function("定时任务更新")
	@ApiOperation(value = "更新定时任务", notes = "更新定时任务信息", httpMethod = "POST",response = Boolean.class)
	public Boolean update(@ApiParam(name = "定时任务对象", value = "传入json格式", required = true)  ScheduleJobEntity entity) {
		 scheduleJobService.update(entity);
		 return Boolean.TRUE;
	}
	
    /**
     * 删除数据
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	@Function("定时任务删除")
	@ApiOperation(value = "删除定时任务",notes = "删除定时任务", httpMethod = "POST",response = Boolean.class)
	public Boolean delete(@ApiParam(name = "删除定时任务", value = "主键ID数组", required = true) @RequestBody List<ScheduleJobEntity> ids) {
		if(CollectionUtils.isNotEmpty(ids)){
			Long[] arr=new Long[ids.size()];
            for (int i = 0; i < ids.size(); i++) {
            	arr[i]=ids.get(i).getJobId();
			}
			scheduleJobService.deleteBatch(arr);
		}
		return Boolean.TRUE;
	}
	/*public Boolean delete(@ApiParam(name = "删除定时任务", value = "主键ID数组", required = true) @RequestBody Long[] jobIds) {
		scheduleJobService.deleteBatch(jobIds);
		return true;
	}*/
	
	
	
	/**
	 * 立即执行任务
	 */
	@RequestMapping("/run")
	@ResponseBody
	@Function("立刻执行定时任务")
	@ApiOperation(value = "立刻执行定时任务",notes = "立刻执行定时任务", httpMethod = "POST",response = Boolean.class)
	public Boolean run(@ApiParam(name = "立刻执行定时任务", value = "主键ID数组", required = true) @RequestBody Long[] jobIds){
		scheduleJobService.run(jobIds);
		return Boolean.TRUE;
	}
    

	/**
	 * 暂停定时任务
	 */
	@RequestMapping(value="/pause",method=RequestMethod.POST)
	@ResponseBody
	@Function("暂停定时任务")
	@ApiOperation(value = "暂停定时任务",notes = "暂停定时任务", httpMethod = "POST",response = Boolean.class)
	public Boolean pause(@RequestBody Long[] jobIds){
		scheduleJobService.pause(jobIds);
		return Boolean.TRUE;
	}
	
	/**
	 * 恢复定时任务
	 */
	@RequestMapping("/resume")
	@ResponseBody
	@Function("恢复定时任务")
	@ApiOperation(value = "恢复定时任务",notes = "恢复定时任务", httpMethod = "POST",response = Boolean.class)
	public Boolean resume(@RequestBody Long[] jobIds){
		scheduleJobService.resume(jobIds);
		return Boolean.TRUE;
	}

	
}
