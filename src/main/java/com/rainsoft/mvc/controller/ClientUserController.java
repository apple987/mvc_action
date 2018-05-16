package com.rainsoft.mvc.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.ClientUser;
import com.rainsoft.mvc.service.ClientUserService;
import com.rainsoft.util.Function;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;

/**
 *clientUser管理
 * @付为地
 * @date 2017-12-28 09:14:09
 */
@Controller
@RequestMapping("/clientUser")
@Api(tags = "用户管理",description = "用户信息管理")
public class ClientUserController extends BaseController{
  

    @Autowired
	private ClientUserService clientUserService;

    /**
	 * 页面初始化
	 */
	@ApiOperation(value = "用户列表",notes = "进入用户列表页", httpMethod = "GET")
	@RequestMapping(value = "init",method = RequestMethod.GET)
	public String init(){
		return "clientUser/selectClientUser";
	}
	
    /**
	 * 分页查询数据
	 */
	@RequestMapping(value="/selectPage",method=RequestMethod.POST)
	@ResponseBody
	@Function("用户分页")
	@ApiOperation(value = "用户分页列表", notes = "用户分页列表", httpMethod = "POST",response = Map.class)
	public Map<String, Object> selectPage(@RequestBody ClientUser entity){
		return responseSelectPage(clientUserService.selectPage(entity));
	}
	
	/**
	 * 跳转添加
	*/
    @RequestMapping(value="/preInsert",method=RequestMethod.GET)
    @ApiOperation(value = "跳转用户添加", notes = "进入用户添加页面", httpMethod = "GET")
	public String preInsert(HttpServletRequest req){
		return "clientUser/insertClientUser";
	} 
	
    /**
     * 添加数据
     */
	@RequestMapping(value="/insert",method=RequestMethod.PUT)
	@ResponseBody
	@Function("用户添加")
	@ApiOperation(value = "用户添加", notes = "创建用户", httpMethod = "POST",response = Boolean.class)
	public Boolean insert(@ApiParam(name = "用户对象", value = "传入json格式", required = true)  @RequestBody ClientUser entity) {
		return clientUserService.insert(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
	/**
	 * 跳转更新
	*/
    @RequestMapping(value="/preUpdate",method=RequestMethod.GET)
    @ApiOperation(value = "跳转用户更新", notes = "进入用户更新页面", httpMethod = "GET")
	public String preUpdate(HttpServletRequest request){
	    request.setAttribute("clientUser", clientUserService.view(request.getParameter("pkid")));
		return "clientUser/updateClientUser";
	} 
	
    /**
     * 更新数据
     */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	@Function("用户更新")
	@ApiOperation(value = "更新用户", notes = "更新用户信息", httpMethod = "POST",response = Boolean.class)
	public Boolean update(@ApiParam(name = "用户对象", value = "传入json格式", required = true) ClientUser entity) {
		return clientUserService.update(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
    /**
     * 删除数据
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	@Function("用户删除")
	@ApiOperation(value = "删除用户",notes = "删除用户", httpMethod = "POST",response = Boolean.class)
	public Boolean delete(@RequestBody List<ClientUser> ids) {
		return clientUserService.batchDelete(ids)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
	/**
	 * 查询返回对象
	 */
	@RequestMapping(value="/getObject",method=RequestMethod.GET)
	@ApiOperation(value = "查询用户", notes = "查询用户信息", httpMethod = "GET")
	@ApiResponse(code = 200, message = "执行成功", response =ClientUser.class, responseContainer = "Map" )
	@ResponseBody
	public ClientUser getObject(@ApiParam(name = "pkid", value = "主键", required = true) @RequestParam(value="pkid",required=true) String pkid){
		return clientUserService.view(pkid);
	} 
    
}
