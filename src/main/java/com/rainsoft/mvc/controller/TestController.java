package com.rainsoft.mvc.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.redisson.api.CronSchedule;
import org.redisson.api.RScheduledExecutorService;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.DataInterrupt;
import com.rainsoft.mvc.model.Solr;
import com.rainsoft.mvc.service.DataInterruptService;
import com.rainsoft.mvc.service.SolrService;
import com.rainsoft.mvc.test.PrintTask;
import com.rainsoft.mvc.test.User;
import com.rainsoft.util.CacheUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import springfox.documentation.annotations.ApiIgnore;

@Api(tags = "系统接口",description = "演示服务接口")

@Controller
@RequestMapping("/user")
public class TestController extends BaseController {
	
	@Resource
	private SolrService solrService;
	
	@Autowired
	private DataInterruptService dataInterruptService;
	
	/*@Autowired
	private JedisCluster jedisCluster;*/
	
	@Autowired
	private CacheUtil cacheUtil;
	
	@Autowired
	private RedissonClient redissonClient;
	
	
	
	/*@RequestMapping(value = "/getSolr",method =RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "根据ID获取solr信息",httpMethod = "GET", notes = "传入ID查询对象", response = Solr.class)*/
	@RequestMapping(value = "/getSolr")
	@ResponseBody
	@ApiOperation(value = "根据ID获取solr信息", notes = "传入ID查询对象", response = Solr.class)
	/*public Solr getSolr(@ApiParam(required = true, value = "Solr编号", name = "id") @RequestParam(value = "id") String id) {*/
	public Solr getSolr(String id) {
		System.err.println("====>getSolr方法拿到参数是:"+id);
		Solr so=solrService.view(id);
		return so;
	}
    
	/**
	 * 忽略本接口
	 *  @ApiIgnore
	 *  或者hidden=true也可以实现
	 * @param userId
	 * @return
	 */
	@ApiIgnore
	@RequestMapping(value = "/getUser")
	@ResponseBody
	@ApiOperation(value = "根据ID获取用户信息",position=2, httpMethod = "GET", notes = "get user by id", response = Solr.class)
	public Solr getUser(
			@ApiParam(required = true, value = "用户ID", name = "userId") @RequestParam(value = "userId") Integer userId) {
		return solrService.view(String.valueOf(userId));
	}
    
	/**
	 * 简单测试
	 *  返回结果是个对象
	 *  对象采用swagger注解之后,
	 * 页面就可以对象字段描述信息,以及相应结果
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getInfo", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	@ApiOperation(value = "获取solr信息",position=1, httpMethod = "POST", notes = "ID查询对象", response = Solr.class, hidden = true)
	@ApiResponse( code = 200, message = "Success", response = Solr.class, responseContainer = "Map" )
	public Solr getInfo(@ApiParam(required = true, value = "编号", name = "id") @RequestParam(value = "id") String id) {
		return solrService.view(id);
	}
    
	/**
	 * swagger简单测试
	 *     传入参数对象:字段描述
	 *     响应参数对象:字段描述
	 * 暂时使用@ApiResponse注解可以满足功能需求,@ApiResponses注解暂时还没有搞明白
	 *  还有一点,针对Result<List<User>>这种复杂结构返回数据格式,最好指定response = User.class,就是Result<List<User>>最内层的swagger实体类对象
	 *  当然,其他类Result,List(如果有可以加) 最好也加上@ApiModel(value = "用户对象", description = "user2")注解描述响应对象的信息
	 *  
	 */
	@ApiOperation(value = "添加用户", notes = "创建新用户信息",position=0, httpMethod = "POST", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@RequestMapping(value = "add", method = RequestMethod.POST)
    @ApiResponse( code = 200, message = "请求成功", response = User.class, responseContainer = "Set" )
	public Result<User> add(@ApiParam(name = "user", value = "传入json格式", required = true) @RequestBody User user) {
		System.out.println(user);
		Result<User> usr = new Result<User>();
		User u = new User();
		u.setName("swagger测试");
		u.setPassword("123456");
		u.setSex(1);
		u.setToken("123456789");
		usr.setData(u);
		return usr;
	}
    /**
     * swagger简单测试
	 *     传入参数:字段描述
	 *     响应参数对象:字段描述 
     * @param categoryId
     * @param categoryId2
     * @param token
     * @return
     */
	//列出某个类目的所有规格
	@ApiOperation(value = "获得用户列表", notes = "列表信息",position=4, httpMethod = "POST", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.POST)
	/*@ApiResponses( value = {@ApiResponse( code = 200, message = "请求成功", response = Result.class, responseContainer = "List" ),
	                        @ApiResponse( code = 200, message = "请求成功", response = User.class, responseContainer = "Set" )
	})*/
	@ApiResponse( code = 200, message = "请求成功", response = User.class, responseContainer = "Map" )
	public Result<List<User>> list(@ApiParam(value = "分类ID", required = true) @RequestParam Long categoryId,
			@ApiParam(value = "分类ID", required = true) @RequestParam Long categoryId2,
			@ApiParam(value = "token", required = true) @RequestParam String token) {
		List<User> arr=new ArrayList<User>();
		User u = new User();
		u.setName("swagger测试");
		u.setPassword("123456");
		u.setSex(1);
		u.setToken("123456789");
		arr.add(u);
		User u1 = new User();
		u1.setName("王大锤");
		u1.setPassword("258369");
		u1.setSex(0);
		u1.setToken("147258");
		arr.add(u1);
		Result<List<User>> result = new Result<List<User>>();
		result.setData(arr);
		return result;
	}
	
	
	/**
	 * 
	 * @param categoryId
	 * @param categoryId2
	 * @param token
	 * @return
	 */
	@ApiOperation(value = "查询用户列表", notes = "列表信息",position=5, httpMethod = "POST", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@RequestMapping(value = "find", method = RequestMethod.POST)
	@ApiResponses( value = {@ApiResponse( code = 200, message = "请求成功", response = Result.class, responseContainer = "List" ),
	                        @ApiResponse( code = 404, message = "资源未找到"),
	                        @ApiResponse( code = 500, message = "系统出错了")
	})
	public List<User> find(@ApiParam(value = "分类ID", required = true) @RequestParam Long categoryId,@ApiParam(value = "token", required = true) @RequestParam String token) {
		List<User> arr=new ArrayList<User>();
		User u = new User();
		u.setName("swagger测试");
		u.setPassword("123456");
		u.setSex(1);
		u.setToken("123456789");
		arr.add(u);
		User u1 = new User();
		u1.setName("王大锤");
		u1.setPassword("258369");
		u1.setSex(0);
		u1.setToken("147258");
		arr.add(u1);
		return arr;
	}
	
	

	@RequestMapping(value = "/getDataSolr")
	@ResponseBody
	@ApiOperation(value = "获取solr信息", position=3,httpMethod = "POST", notes = "查询SOLR对象", response = Solr.class)
	public Solr getDataSolr(@ApiParam(required = true, value = "Solr编号", name = "id") @RequestParam(value = "id") String id) {
		return solrService.view(id);
	}
	/******************************JTA分布式事务简单测试*********************************************************/
	/**
	 * jta添加测试
	 * @return
	 */
	@ApiOperation(value = "测试Jta分布式事务",httpMethod = "POST", notes = "JTA<strong>添加</strong>数据到两个数据库")
	@RequestMapping("/jtaInsert")
	public  String jtaInsert(){
		DataInterrupt dt=new DataInterrupt();
		dt.setBreakSource("1");
		dt.setStatus("1");
		dt.setEndTime(new Date());
		dt.setImportTime(new Date());
		dt.setStartTime(new Date());
		dataInterruptService.insert(dt);
		/*jedisCluster.setex("apple", 120, "你好啊！");*/
		cacheUtil.set("kingmen", "王牌特工2", 120);
		return "dataInterrupt"; 
	}
	/**
	 * JTA测试更新
	 * @return
	 */
	@ApiOperation(value = "测试Jta分布式事务",httpMethod = "POST", notes = "JTA<strong>更新</strong>数据到两个数据库")
	@RequestMapping("/jtaUpdate")
	public  String jtaUpdate(){
		List<Solr> arr=solrService.selectList(null);
		if(!CollectionUtils.isEmpty(arr)){
			Solr s=arr.get(0);
			s.setName("更新测试分布式事务");
			solrService.update(s);
		}
		return "dataInterrupt"; 
	}
	
	/**
	 * JTA测试删除
	 * @return
	 */
	@ApiOperation(value = "测试Jta分布式事务",httpMethod = "POST", notes = "JTA<strong>删除</strong>数据到两个数据库")
	@RequestMapping("/jtaDelete")
	public  String jtaDelete(){
		List<Solr> arr=solrService.selectList(null);
		if(!CollectionUtils.isEmpty(arr)){
			solrService.delete(arr.get(0).getId());
		}
		return "dataInterrupt"; 
	}
	
	/*********************************************************************************************************/
	/**
	 * jta添加测试,整合JMS测试
	 * @return
	 */
	@ApiOperation(value = "测试Jta整合JMS分布式事务",httpMethod = "POST", notes = "JTA<strong>添加</strong>数据到两个数据库和JMS事务")
	@RequestMapping("/jtaJmsInsert")
	public  String jtaJmsInsert(){
		DataInterrupt dt=new DataInterrupt();
		dt.setBreakSource("1");
		dt.setStatus("1");
		dt.setEndTime(new Date());
		dt.setImportTime(new Date());
		dt.setStartTime(new Date());
		dataInterruptService.insert(dt);
		return "dataInterrupt"; 
	}
	/**
	 * JTA测试更新,整合JMS测试
	 * @return
	 */
	@ApiOperation(value = "测试Jta整合JMS分布式事务",httpMethod = "POST", notes = "JTA<strong>更新</strong>数据到两个数据库和JMS事务")
	@RequestMapping("/jtaJmsUpdate")
	public  String jtaJmsUpdate(){
		List<Solr> arr=solrService.selectList(null);
		if(!CollectionUtils.isEmpty(arr)){
			Solr s=arr.get(0);
			s.setName("更新测试分布式事务");
			solrService.update(s);
		}
		return "dataInterrupt"; 
	}
	
	/**
	 * JTA测试删除,整合JMS测试
	 * @return
	 */
	@ApiOperation(value = "测试Jta整合JMS分布式事务",httpMethod = "POST", notes = "JTA<strong>删除</strong>数据到两个数据库和JMS事务")
	@RequestMapping("/jtaJmsDelete")
	public  String jtaJmsDelete(){
		List<Solr> arr=solrService.selectList(null);
		if(!CollectionUtils.isEmpty(arr)){
			solrService.delete(arr.get(0).getId());
		}
		return "dataInterrupt"; 
	}
	
	
	/***********************************************测试redission简单使用**********************************************************/
	@ApiOperation(value = "测试redission分布式任务",httpMethod = "POST", notes = "采用redission执行分布式任务调度配置")
	@RequestMapping("/distJob")
	public String distJob(){
		RScheduledExecutorService executorService = redissonClient.getExecutorService("myExecutor");
		/*executorService.schedule(new PrintTask("测试redission分布式任务01"), CronSchedule.of("10 0/5 * * * ?"));*/
		executorService.schedule(new PrintTask("测试redission分布式任务01"), CronSchedule.of("0/1 * * * * ?"));
		// ...
		//executorService.schedule(new PrintTask("测试redission分布式任务02"), CronSchedule.dailyAtHourAndMinute(10, 5));
		// ...
		//executorService.schedule(new PrintTask("测试redission分布式任务03"), CronSchedule.weeklyOnDayAndHourAndMinute(12, 4, Calendar.MONDAY, Calendar.FRIDAY));
		
		return "dataInterrupt"; 
	}
	
	
	
}
