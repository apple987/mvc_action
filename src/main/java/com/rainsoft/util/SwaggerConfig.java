package com.rainsoft.util;

import java.util.ArrayList;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.rainsoft.mvc.test.Foo;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration //必须存在
@EnableSwagger2 //必须存在
@EnableWebMvc //必须存在
@ComponentScan(basePackages = {"com.rainsoft"})//必须存在
//配置SWAGGER需要扫描的接口包
public class SwaggerConfig{
	
	@Resource
	private Properties mailInfo;
	
	
	/*添加自定义异常信息*/
	private ArrayList<ResponseMessage> responseMessages = new ArrayList<ResponseMessage>() {
		private static final long serialVersionUID = 1L;
		{
			add(new ResponseMessageBuilder().code(200).message("请求成功").responseModel(null).build());
			add(new ResponseMessageBuilder().code(400).message("请求参数错误").responseModel(new ModelRef("Error")).build());
			add(new ResponseMessageBuilder().code(401).message("权限认证失败").responseModel(new ModelRef("Error")).build());
			/*add(new ResponseMessageBuilder().code(403).message("请求资源不可用").responseModel(new ModelRef("Error")).build());*/
			add(new ResponseMessageBuilder().code(404).message("请求资源不存在").responseModel(new ModelRef("Error")).build());
			add(new ResponseMessageBuilder().code(405).message("请求方式不支持").responseModel(new ModelRef("Error")).build());
			/*add(new ResponseMessageBuilder().code(409).message("请求资源冲突").responseModel(new ModelRef("Error")).build());
			add(new ResponseMessageBuilder().code(415).message("请求格式错误").responseModel(new ModelRef("Error")).build());
			add(new ResponseMessageBuilder().code(423).message("请求资源被锁定").responseModel(new ModelRef("Error")).build());*/
			add(new ResponseMessageBuilder().code(500).message("服务器内部错误").responseModel(new ModelRef("Error")).build());
			/*add(new ResponseMessageBuilder().code(501).message("请求方法不存在").responseModel(new ModelRef("Error")).build());
			add(new ResponseMessageBuilder().code(503).message("服务暂时不可用").responseModel(new ModelRef("Error")).build());*/
		}
	};
	
	/**
	 * swagger分组OpenApi
	 * @return
	 */
    @Bean
    public Docket customDocket() {
    	//自定义异常信息
        return new Docket(DocumentationType.SWAGGER_2)
        		.enable(Boolean.valueOf(mailInfo.getProperty("swagger.group.open.enabled")))
        		.groupName("OpenApi")
        		.genericModelSubstitutes(DeferredResult.class)
        		.globalResponseMessage(RequestMethod.GET, responseMessages)
                .globalResponseMessage(RequestMethod.POST, responseMessages)
                .globalResponseMessage(RequestMethod.PUT, responseMessages)
                .globalResponseMessage(RequestMethod.DELETE, responseMessages)
                .globalResponseMessage(RequestMethod.PATCH, responseMessages)
                /*.pathMapping("/mvc")*/
        		.apiInfo(apiInfo());
    }
    /**
     * swagger分组OpenApi
     * 配置文档说明信息
     * @return
     */
    private ApiInfo apiInfo() {
        Contact contact = new Contact("付为地", "", "1335157415@qq.com");
        StringBuffer sb=new StringBuffer(1024);
        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Swagger</strong>是一款RESTFUL接口的文档在线自动生成+功能测试功能软件,用于生成、描述、调用和可视化 RESTful风格的 Web服务。<br>总体目标是使客户端和文件系统作为服务器以同样的速度来更新,文件的方法，参数和模型紧密集成到服务器端的代码，允许API来始终保持同步。<br>");
        sb.append("<strong>注意事项:</strong><ul><br>");
        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>1.本接口文档,如果没有特殊限定,默认仅支持<strong>POST</strong>方式。<br></li>");
        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>2.参数描述<strong>模型</strong>和<strong>示例</strong>,分别针对请求的<strong>参数结构</strong>和<strong>参数示例</strong>进行描述。<br></li>");
        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>3.响应描述<strong>模型</strong>和<strong>示例</strong>,分别针对响应的<strong>数据结构</strong>和<strong>数据示例</strong>进行描述。<br></li></ul>");
        return new ApiInfoBuilder()
                .title("API开放接口")
                .description(sb.toString())
                .contact(contact)
                .version("1.1.0")
                .build();
    }
    
    /**
	 * swagger分组InnerApi
	 * apis(RequestHandlerSelectors.basePackage("com.rainsoft.mvc.test"))  
	 *    配置扫描com.rainsoft.mvc.test包，生成对应swagger文档
	 * @return
	 */
    @Bean
    public Docket InnerApi() {
        return new Docket(DocumentationType.SWAGGER_2)
        		.enable(Boolean.valueOf(mailInfo.getProperty("swagger.group.inner.enabled")))
                .groupName("InnerApi")  
                .genericModelSubstitutes(DeferredResult.class)  
                .useDefaultResponseMessages(false)  
                .forCodeGeneration(true)  
                .select()  
                .apis(RequestHandlerSelectors.basePackage("com.rainsoft.mvc.test"))  
                .paths(PathSelectors.any())
                .build()  
                .globalResponseMessage(RequestMethod.GET, responseMessages)
                .globalResponseMessage(RequestMethod.POST, responseMessages)
                .globalResponseMessage(RequestMethod.PUT, responseMessages)
                .globalResponseMessage(RequestMethod.DELETE, responseMessages)
                .globalResponseMessage(RequestMethod.PATCH, responseMessages)
                /*.pathMapping("/mvc")*/
                .apiInfo(innerApiInfo());
    }
    /**
     * swagger分组InnerApi
     * 配置文档说明信息
     * @return
     */
    private ApiInfo innerApiInfo() {
	        Contact contact = new Contact("付为地", "", "1335157415@qq.com");
	        StringBuffer sb=new StringBuffer(1024);
	        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Swagger</strong>是一款RESTFUL接口的文档在线自动生成+功能测试功能软件,用于生成、描述、调用和可视化 RESTful风格的 Web服务。<br>总体目标是使客户端和文件系统作为服务器以同样的速度来更新,文件的方法，参数和模型紧密集成到服务器端的代码，允许API来始终保持同步。<br>");
	        sb.append("<strong>注意事项:</strong><ul><br>");
	        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>1.本接口文档,如果没有特殊限定,默认仅支持<strong>POST</strong>方式。<br></li>");
	        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>2.参数描述<strong>模型</strong>和<strong>示例</strong>,分别针对请求的<strong>参数结构</strong>和<strong>参数示例</strong>进行描述。<br></li>");
	        sb.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li>3.响应描述<strong>模型</strong>和<strong>示例</strong>,分别针对响应的<strong>数据结构</strong>和<strong>数据示例</strong>进行描述。<br></li></ul>");
	        return new ApiInfoBuilder()
	                .title("API内部接口")
	                .description(sb.toString())
	                .contact(contact)
	                .version("1.1.0")
	                .build();
    }
    
    
    /*private ApiInfo apiInfo() {
        Contact contact = new Contact("付为地", "http://www.cnblogs.com/getupmorning/", "1335157415@qq.com");
        return new ApiInfoBuilder()
                .title("API接口")
                .description("提供详细的后台所有Restful接口")
                //.contact("付为地")
                .version("1.1.0")
                .build();
    }*/
    
   /* private ApiInfo apiInfo() {
		ApiInfo apiInfo = new ApiInfo("小雷移动端API接口平台",
				"提供详细的后台所有Restful接口", "http://blog.csdn.net/FansUnion",
				"FansUnion@qq.com", "小雷博客","", "");
		return apiInfo;
	}*/
    
    /* private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
            .title("Swagger2 接口文档示例")//设置文档的标题
            .description("更多内容请关注：http://www.abc.com")//设置文档的描述->1.Overview
            .version(VERSION)//设置文档的版本信息-> 1.1 Version information
            .contact(new Contact("ABC Boot", "http://www.abc.comt", ""))//设置文档的联系方式->1.2 Contact information
            .termsOfServiceUrl("www.abc.com")//设置文档的License信息->1.3 License information
            .build();
    }*/
    
    @Bean(initMethod = "init")
    public Foo foo() {
        return new Foo();
    }
    
}