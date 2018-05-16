package test;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.client.RestTemplate;

import com.rainsoft.mvc.service.StudentService;
import com.rainsoft.mvc.test.TestController1;
import com.rainsoft.mvc.test.User;

/*单元测试类*/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:spring/spring-*.xml", "classpath:spring-mvc.xml" })
public class ControllerTest {
	@Autowired  
    ServletContext context;  
  
    MockMvc mockMvc;  
    
    @Before  
    public void setup(){  
        mockMvc = MockMvcBuilders.standaloneSetup(context).build();  
    }  
    
	@Autowired
	private StudentService studentService;
	
	@Resource(name = "restTemplate")
	private RestTemplate restTemplate;
	
	@Autowired  
	private TestController1 testController1;
	
	
	@Test
	public void myTest(){
		System.err.println(testController1.hello());
		System.err.println(testController1.updateCustomer("147258", new User("王五","123456",1,"147258369")));
		System.err.println(studentService.selectList(null));
		System.err.println("getForObject两个参数url,respClass响应结果是:"+restTemplate.getForObject("http://localhost:8099/mvc/user/getSolr?id=17092214403942695521",String.class));
	}
	
}
