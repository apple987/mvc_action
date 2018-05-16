package com.rainsoft.module.solr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.controller.Result;
import com.rainsoft.util.solr.Foo;
import com.rainsoft.util.solr.SolrjUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;

@Controller
@Api(tags = "Solrj服务接口", description = "演示Solrj服务接口")
@RequestMapping("/solrj")
public class SolrDataController extends BaseController {

	@Autowired
	private SolrjUtil solrjUtil;

	@RequestMapping(value = "/testAdd", method = RequestMethod.PUT)
	@ResponseBody
	@ApiOperation(value = "Solrj添加数据", httpMethod = "PUT", notes = "测试Solrj添加数据", response = Void.class)
	public void testAdd(@ApiParam(required = true, value = "传入JSON对象参数", name = "msg") @RequestBody Foo msg)throws Exception {
		solrjUtil.merge(msg);
	}

	@ApiOperation(value = "SolrJ多条件查询", notes = "SolrJ多条件列表信息", httpMethod = "POST", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@RequestMapping(value = "testMutiSearch", method = RequestMethod.POST)
	@ApiResponse(code = 200, message = "请求成功", response = Foo.class, responseContainer = "Map")
	/*public Result<List<Foo>> testMutiSearch(@ApiParam(name = "condition", value = "复杂条件表达式", required = true, example = "title:永汉 OR price:400 AND id:1497854074330") @RequestParam String condition,
			@ApiParam(name = "start", value = "开始记录数", required = true, example = "1",defaultValue="1")  int start,
			@ApiParam(name = "end", value = "截止记录数", required = true, example = "10",defaultValue="10")  int end) throws Exception {
	 */ 
	@ApiImplicitParams({
		@ApiImplicitParam(name = "token", value = "令牌",dataType="String",paramType ="header", required = true, example = "title:永汉 OR price:400 AND id:1497854074330"),
		@ApiImplicitParam(name = "condition", value = "复杂条件表达式",dataType="String",paramType ="query", required = true, example = "title:永汉 OR price:400 AND id:1497854074330"),
		@ApiImplicitParam(name = "start", value = "开始记录数",dataType="int",paramType ="query", required = true, example = "1",defaultValue="1"),
		@ApiImplicitParam(name = "end", value = "截止记录数",dataType="int",paramType ="query", required = true, example = "10",defaultValue="10")
	})
	public Result<List<Foo>> testMutiSearch(String token,String condition,int start,int end)throws Exception{
			Result<List<Foo>> res = new Result<List<Foo>>();
			List<Foo> foos = solrjUtil.search(condition, start, end);
			for (Foo foo : foos) {
				System.out.println(JSON.toJSONString(foo));
			}
			res.setData(foos);
			return res;
	}

	@RequestMapping(value = "/testDeleteByQuery", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "Solrj根据条件删除", httpMethod = "GET", notes = "测试Solrj根据条件删除", response = Void.class)
	public void testDeleteByQuery(
			@ApiParam(name = "arg", value = "条件表达式", required = true, example = "title:玩耍") @RequestParam String arg)
			throws Exception {
		solrjUtil.deleteByQuery(arg);
	}

	@RequestMapping(value = "/testUpdate", method = RequestMethod.POST)
	@ResponseBody
	@ApiOperation(value = "Solrj更新数据", httpMethod = "POST", notes = "测试Solrj更新数据", response = Void.class)
	public void testUpdate(@ApiParam(required = true, value = "传入JSON对象参数", name = "msg") @RequestBody Foo msg) throws Exception {
		solrjUtil.merge(msg);
	}
    /*
     * 接口不想暴露可以添加hidden=true或者@ApiIgnore注解添加方法上即可
     */
	/*@ApiOperation(value = "Solrj单条件查询",httpMethod = "GET", notes = "Solrj单条件查询", response = Foo.class, hidden = true)*/
	@ApiOperation(value = "Solrj单条件查询",httpMethod = "GET", notes = "Solrj单条件查询", response = Foo.class)
	@ResponseBody
	@RequestMapping(value = "/testSingleSearch", method = RequestMethod.GET)
	@ApiResponse(code = 200, message = "Success", response = Foo.class, responseContainer = "Map")
	public Result<List<Foo>> testSingleSearch(
			@ApiParam(name = "token", value = "令牌", required = true, example = "token_123456") @RequestHeader String token,
			@ApiParam(name = "condition", value = "条件表达式", required = true, example = "title:玩耍") @RequestParam String condition,
			@ApiParam(name = "start", value = "开始记录数", required = true, example = "1",defaultValue="1",allowableValues="1,2,3") @RequestParam int start,
			@ApiParam(name = "end", value = "截止记录数", required = true, example = "10",defaultValue="10") @RequestParam int end)
			throws Exception {
		System.err.println("token:"+token);
		Result<List<Foo>> res = new Result<List<Foo>>();
		List<Foo> foos = solrjUtil.search(condition, start, end);
		for (Foo foo : foos) {
			System.out.println(JSON.toJSONString(foo));
		}
		res.setData(foos);
		return res;
	}
}
