package com.rainsoft.mvc.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.SysLog;
import com.rainsoft.util.log.LogUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * sysLog管理
 * 
 * @付为地
 * @date 2018-01-10 02:25:29
 */
@Controller
@RequestMapping("/sysLog")
@Api(tags = "日志表管理", description = "日志表信息管理")
public class SysLogController extends BaseController {

	@Resource(name = "logUtil")
	private LogUtil logUtil;

	/**
	 * 页面初始化
	 */
	@ApiOperation(value = "日志表列表", notes = "进入日志表列表页", httpMethod = "GET")
	@RequestMapping(value = "init", method = RequestMethod.GET)
	public String init() {
		return "sysLog/selectSysLog";
	}

	/**
	 * 分页查询数据
	 */
	@RequestMapping(value = "/selectPage", method = RequestMethod.POST)
	@ResponseBody
	@ApiOperation(value = "日志表分页列表", notes = "日志表分页列表", httpMethod = "POST", response = Map.class)
	public Map<String, Object> selectPage(@RequestBody SysLog entity) {
		/* System.err.println(1/0); */
		return responseSelectPage(logUtil.selectPage(entity));
	}

	/**
	 * 跳转更新
	 */
	@RequestMapping(value = "/preUpdate", method = RequestMethod.GET)
	@ApiOperation(value = "跳转日志表更新", notes = "进入日志表更新页面", httpMethod = "GET")
	public String preUpdate(HttpServletRequest request) {
		request.setAttribute("sysLog", logUtil.view(Integer.parseInt(request.getParameter("id"))));
		return "sysLog/updateSysLog";
	}

}
