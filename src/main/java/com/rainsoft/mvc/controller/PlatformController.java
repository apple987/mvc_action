package com.rainsoft.mvc.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.Platform;
import com.rainsoft.mvc.service.PlatformService;

import springfox.documentation.annotations.ApiIgnore;

import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;
import java.util.Map;

/**
 *platform管理
 * @付为地
 * @date 2017-07-11 11:01:20
 */
@ApiIgnore
@Controller
@RequestMapping("/platform")
public class PlatformController extends BaseController{
  

    @Autowired
	private PlatformService platformService;

    /**
	 * 页面初始化
	 */
	@RequestMapping("/init")
	public String init(){
		return "platform/selectPlatform";
	}
	
    /**
	 * 分页查询数据
	 */
	@RequestMapping(value="/selectPage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectPage(@RequestBody Platform entity){
		return responseSelectPage(platformService.selectPage(entity));
	}
	
	/**
	 * 跳转添加
	*/
    @RequestMapping(value="/preInsert",method=RequestMethod.GET)
	public String preInsert(HttpServletRequest req){
		return "platform/insertPlatform";
	} 
	
    /**
     * 添加数据
     */
	@RequestMapping(value="/insert",method=RequestMethod.PUT)
	@ResponseBody
	public Boolean insert(@RequestBody Platform entity) {
		return platformService.insert(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
	/**
	 * 跳转更新
	*/
    @RequestMapping(value="/preUpdate",method=RequestMethod.GET)
	public String preUpdate(HttpServletRequest request){
	    request.setAttribute("platform", platformService.view(Integer.parseInt(request.getParameter("id"))));
		return "platform/updatePlatform";
	} 
	
    /**
     * 更新数据
     */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public Boolean update(Platform entity) {
		return platformService.update(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
    /**
     * 删除数据
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Boolean delete(@RequestBody List<Platform> ids) {
		return platformService.batchDelete(ids)>0?Boolean.TRUE:Boolean.FALSE;
	}
    
}
