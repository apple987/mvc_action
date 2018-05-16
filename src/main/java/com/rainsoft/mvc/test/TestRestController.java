package com.rainsoft.mvc.test;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rainsoft.mvc.model.Solr;
import com.rainsoft.util.MacUtils;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
@Api(tags="测试rest接口",description="简单测试@RestController注解的,restful接口")
@RestController
@RequestMapping("/rest")
public class TestRestController {

	@ApiOperation(value = "模拟拿getData数据", notes = "测试getData",position=1,response = Solr.class)
	@RequestMapping(value = "/getData", method = {RequestMethod.GET,RequestMethod.POST})
	public Solr getData(@RequestParam Map<String, Object> param,HttpServletRequest request) throws Exception {
		 System.err.println("传入参数:"+param);
		 Solr sr=new Solr();
		 sr.setId("123456");
		 sr.setPrice(250);
		 sr.setName("简单restTemplate测试");
	     sr.setTitle("简单restTemplate测试,标题文件");
	     System.err.println("电脑的MAC是:"+MacUtils.getMac());
	     String ip=MacUtils.getIpAddr(request);
	     System.err.println("HTTP电脑的IP是:"+ip);
	     System.err.println("HTTP电脑的MAC是:"+MacUtils.getMACAddress(ip));
	     return sr;
	}
	
	@ApiOperation(value = "模拟拿getJSP数据", position=0,notes = "测试getJSP",response = Solr.class)
	@RequestMapping(value = "/getJSP", method = RequestMethod.GET)
	public String getJSP(@RequestParam Map<String, Object> param) {
		 System.err.println("传入参数:"+param);
		 return "solr/selectSolr";
	}
	
}
