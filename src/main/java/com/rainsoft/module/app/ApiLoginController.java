package com.rainsoft.module.app;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.rainsoft.module.util.JwtUtils;
import com.rainsoft.module.util.Login;
import com.rainsoft.mvc.controller.Result;
import com.rainsoft.mvc.test.User;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * APP登录授权
 */
@Api(tags = "APP登录",description = "演示服务接口")
@RestController
@RequestMapping("/app")
public class ApiLoginController {
	
   /* @Autowired
    private UserService userService;*/
    @Autowired
    private JwtUtils jwtUtils;
    
    /*@Autowired
    private RedisClusterUtil redisClusterUtil;*/
    
    
    /**
     * 登录
     *   相同账号，每一次登录生成的token都是不一样的
     *     比如说第一次生成一个token，虽然token还没有过期，但是第二次继续登录，又重新生成一个token
     *     这就会导致，相同账户两个token都是有效的，那么获取数据的时候，使用第一次生成的token，也可以拿到数据吗？
     *     这显然不合适，这里需要加一个处理
     *     简单点就是以最后一次登录生成的token为有效，生成最后一次token时，销毁当前账户，以前的token，保证最后一次登录的token才有效果。
     *     方案优化版本：某一次登录操作，需要生成token时，先判断上一次获取token是否有效，如果依然有效，那就继续返回上次生成token给用户
     *               如果上次token已经失效，那就重新生成新token给用户
     *        
     */
    @ApiOperation(value = "APP登录", httpMethod = "POST", notes = "手机端登录", response = Result.class)
    @PostMapping("login")
    public Result<HashMap<String, Object>> login(@ApiParam(required = true, value = "手机号", name = "mobile") @RequestParam(value = "mobile") String mobile,
    		@ApiParam(required = true, value = "账户密码", name = "password") @RequestParam(value = "password")  String password){
    	Result<HashMap<String, Object>> res=new Result<HashMap<String, Object>>();
        //用户登录
        /*long userId = userService.login(mobile, password);
        //生成token
        String token = jwtUtils.generateToken(userId);*/
    	/*销毁当前账户，本次登录之前的token信息*/
    	/*TreeSet<String> ts = redisClusterUtil.keys("*");
		Iterator<String> it = ts.iterator();
		while (it.hasNext()) {
			String key=it.next();
			User usr=redisClusterUtil.get(key.getBytes(), User.class);
			System.err.println("keys是:" + key+"\t mobile"+usr.getName());
			if(!ObjectUtils.isEmpty(usr)&&StringUtils.isNotEmpty(usr.getName())&&usr.getName().equals(mobile)){
				redisClusterUtil.remove(key);
			}
		}*/
    	String token = jwtUtils.generateToken(Long.valueOf(mobile));
    	System.err.println("生成token是:"+token);
    	HashMap<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("expire", jwtUtils.getExpire());
        res.setData(map);
        User usr=new User();
    	usr.setName(mobile);
    	usr.setPassword(password);
    	usr.setToken(token);
    	jwtUtils.set(token.getBytes(), 604800, usr);
        return res;
    }

    
    @Login
    @GetMapping("userId")
    public Result<User> userInfo(
    		@ApiParam(required = true, value = "令牌", name = "token") @RequestHeader(value = "token")  String token,
    		@ApiParam(required = true, value = "用户名", name = "userId") @RequestParam(value = "userId")  Integer userId){
    	/*System.err.println(req.getParameter("token"));
    	System.err.println(req.getHeader("token"));*/
    	System.err.println(token);
    	Result<User> res=new Result<User>();
    	User usr=new User();
    	usr.setName(String.valueOf(userId));
    	usr.setPassword(String.valueOf(userId));
    	usr.setSex(1);
    	usr.setToken(token);
    	res.setData(usr);
    	User usr1=jwtUtils.get(token.getBytes(), User.class);
    	System.err.println("序列化拿到的用户信息是:"+JSON.toJSONString(usr1));
    	return res;
    }
}
