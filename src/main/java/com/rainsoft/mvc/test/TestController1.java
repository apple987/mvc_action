package com.rainsoft.mvc.test;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.TextMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
/*import static org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders.get;*/
import com.alibaba.fastjson.JSON;
import com.rainsoft.mvc.model.Solr;
import com.rainsoft.mvc.service.ConsumerService;
import com.rainsoft.mvc.service.ProducerService;
import com.rainsoft.util.SessionUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@Api(tags = "activeMq测试",position=1, description = "测试消息队列")
@Controller
@RequestMapping("/test")
public class TestController1 {
	private Logger logger = LoggerFactory.getLogger(TestController1.class);
	@Resource(name = "mvcQueue")
	private Destination destination;

	// 队列消息生产者
	@Resource(name = "producerService")
	private ProducerService producer;

	// 队列消息消费者
	@Resource(name = "consumerService")
	private ConsumerService consumer;
	
	@Resource(name = "restTemplate")
	private RestTemplate restTemplate;

	@ApiOperation(value = "一个测试API", notes = "第一个测试api",response = String.class)
	@ResponseBody
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String hello() {
		/*System.err.println("响应结果是:"+restTemplate.postForObject("http://localhost:8080/api-web/repayment/repay-back-lianlian_test/147", "", String.class));*/
		return "hello";
	}

	@RequestMapping(value = "/SendMessage", method = RequestMethod.GET)
	@ResponseBody
	@ApiOperation(value = "发送消息", httpMethod = "GET", notes = "生产者发送消息", response = Void.class)
	public void send(@ApiParam(required = true, value = "消息", name = "msg") @RequestParam(value = "msg") String msg) {
		logger.info(Thread.currentThread().getName() + "------------send to jms Start");
		producer.sendMessage(msg);
		logger.info(Thread.currentThread().getName() + "------------send to jms End");
	}

	@ApiOperation(value = "接收消息", httpMethod = "GET", notes = "消费者接收消息", response = Object.class)
	@RequestMapping(value = "/ReceiveMessage", method = RequestMethod.GET)
	@ResponseBody
	public Object receive()  {
		logger.info(Thread.currentThread().getName() + "------------receive from jms Start");
		String text="没有消息哟";
		TextMessage textMessage = (TextMessage) consumer.receive(destination);
		try {
			text=textMessage.getText();
		} catch (JMSException e) {
			e.printStackTrace();
		}
		logger.info(Thread.currentThread().getName() + "------------receive from jms End");
		return text;
	}
	
	
	@ApiOperation(value = "模拟拿getData数据", notes = "测试getData",response = Solr.class)
	@RequestMapping(value = "/getData", method = RequestMethod.GET)
	@ResponseBody
	public Solr getData(@RequestParam Map<String, Object> param) {
		 System.err.println("传入参数:"+param);
		 Solr sr=new Solr();
		 sr.setId("123456");
		 sr.setPrice(250);
		 sr.setName("简单restTemplate测试");
	     sr.setTitle("简单restTemplate测试,标题文件");
	     return sr;
	}
	
	/**
	 * 测试resetPost传递参数
	 * @param id
	 * @param user
	 * @return
	 */
	 @RequestMapping(value = "/updateCustomer/{id}", method = RequestMethod.POST)
     @ResponseBody
     public User updateCustomer(@PathVariable("id") String id, @RequestBody User user) {
         System.err.println("I am in the controller and got ID: "+id);
         System.err.println("I am in the controller and got user name: "+JSON.toJSONString(user));
         return new User("张三","123456",1,"147258369");
     }
	 
	 /**
	* 测试resetPost传递参数
	* @param id
		* @param user
		 * @return
		 */
	 @RequestMapping(value = "/updateCustomerOne/{id}", method = RequestMethod.GET)
	 @ResponseBody
	 public User updateCustomerOne(@PathVariable("id") String id) {
	         System.err.println("I am in the updateCustomerOne controller and got ID: "+id);
	         return new User("张三","123456",1,"147258369");
	 }
	 /**
	  * 传单个参数
	  * @param id
	  * @return
	  */
	 @RequestMapping(value = "/updateCustomerSingle", method = RequestMethod.POST)
     @ResponseBody
     public User updateCustomerSingle(@RequestBody User user) {
         System.err.println("I am in the updateCustomerSingle controller and got user name: "+JSON.toJSONString(user));
         return new User("张三","123456",1,"147258369");
     }
	 
	@ApiOperation(value = "使用RestTemplate工具,发送rest请求", notes = "测试RestTemplate",response = String.class)
	@ResponseBody
	@RequestMapping(value = "/testRestTemplate", method = RequestMethod.GET)
	public String testRestTemplate() {
		/*System.err.println("postForObject响应结果是:"+restTemplate.postForObject("http://localhost:8099/mvc/user/getSolr",null,Solr.class,param));*/
		/*System.err.println("postForObject响应结果是:"+restTemplate.postForEntity("http://localhost:8099/mvc/user/getSolr", formEntity, Solr.class));*/
		/*System.err.println("postForObject响应结果是:"+restTemplate.postForObject("http://localhost:8099/mvc/user/getSolr", formEntity, String.class));*/
		/*System.err.println("postForObject响应结果是:"+restTemplate.postForObject("http://localhost:8099/mvc/user/getSolr", formEntity1, String.class));
		System.err.println("getForObject两个参数url,respClass响应结果是:"+restTemplate.getForObject("http://localhost:8099/mvc/user/getSolr?id=17092214403942695521",String.class));
		System.err.println("getForObject两个参数url,respClass=Solr.class响应结果是:"+restTemplate.getForObject("http://localhost:8099/mvc/user/getSolr?id=17092214403942695521",Solr.class));
		System.err.println("getForObject三个参数url,respClass响应结果是:"+restTemplate.getForObject("http://localhost:8099/mvc/test/getData",Solr.class,param));*/
		HttpServletRequest request = SessionUtil.getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		/*测试POST*/
		//方式1
		Map<String, String> vars = new HashMap<String, String>();
        vars.put("id", "JS01");
        User returns = restTemplate.postForObject(basePath+"/test/updateCustomer/{id}", new User("李四","789456123",1,"369258147"), User.class, vars);
		System.err.println("postForObject响应结果是:"+JSON.toJSONString(returns)); 
		 /*方式2*/
		/* HttpHeaders headers = new HttpHeaders();
		 MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
		 headers.setContentType(type);
		 headers.add("Accept", MediaType.APPLICATION_JSON.toString());
		 HttpEntity<String> formEntity = new HttpEntity<String>(JSON.toJSONString(param), headers);*/
		 Map<String,Object> param=new HashMap<String,Object>();
		 param.put("id", "17092214403942695521");
		 HttpEntity<String> formEntity1 = new HttpEntity<String>(JSON.toJSONString(param));
		 User returns1 = restTemplate.postForObject(basePath+"/test/updateCustomer/{id}", new User("李四","789456123",1,"369258147"), User.class, formEntity1);
		 System.err.println("postForObject1响应结果是:"+JSON.toJSONString(returns1));
		 /*方式三*/
		 User returns2 = restTemplate.getForObject(basePath+"/test/updateCustomerOne/{id}", User.class, param);
		 System.err.println("getForObject2响应updateCustomerOne结果是:"+JSON.toJSONString(returns2));
		 /*方式四*/
		 User returns3 = restTemplate.postForObject(basePath+"/test/updateCustomerSingle", new User("李四","789456123",1,"369258147"), User.class);
		 System.err.println("postForObject2响应updateCustomerSingle结果是:"+JSON.toJSONString(returns3));
		 /*System.err.println(get(basePath+"/test/SendMessage").param("msg", "MokeMVC测试发送消息"));*/
		 return "hello";
	}
	
	
	@ApiOperation(value = "测试Solr查询数据", notes = "测试Solr查询",response = Solr.class)
	@RequestMapping(value = "/getSolrData", method = RequestMethod.GET)
	@ResponseBody
	public Solr getSolrData(@RequestParam Map<String, Object> param) {
		 System.err.println("传入参数:"+param);
		 Solr sr=new Solr();
		 sr.setId("123456");
		 sr.setPrice(250);
		 sr.setName("简单restTemplate测试");
	     sr.setTitle("简单restTemplate测试,标题文件");
	     return sr;
	}

}
