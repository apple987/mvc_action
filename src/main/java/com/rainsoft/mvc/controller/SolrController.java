package com.rainsoft.mvc.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.redisson.api.RAtomicLong;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.Solr;
import com.rainsoft.mvc.service.SolrService;
import com.rainsoft.util.Function;
import com.rainsoft.util.SerialNo;
import com.rainsoft.util.lock.RedisLock;
import com.rainsoft.util.lock.RedisLockKey;

import springfox.documentation.annotations.ApiIgnore;

/**
 * solr管理
 * 
 * @付为地
 * @date 2017-09-21 01:59:19
 */
@ApiIgnore
@Controller
@RequestMapping("/solr")
public class SolrController extends BaseController {
	@Autowired
	private SolrService solrService;

	@Autowired
	private RedissonClient redissonClient;

	private static int i = 0;
	
	@Resource(name = "mailInfo")
	private Properties  mailInfo;
	

	/**
	 * 测试注解使用redisLock
	 * 
	 * @param key
	 * @param key1
	 */
	@RequestMapping(value = "/redisLockTest")
	@ResponseBody
	@RedisLock(lockKey = "lockKey")
	@Function("测试分布式注解")
	public boolean redisLockTest() throws InterruptedException {
		/*for (int i = 0; i < 100; i++) {
			Thread t = new Thread(new Runnable() {
				@Override
				public void run() {
					try {
						TimeUnit.SECONDS.sleep(1);
					} catch (Exception e) {
						e.printStackTrace();
					}
					test("***********testDistLockAop", 99);
				}
			});
			t.start();
		}*/
		RAtomicLong atomicLong = redissonClient.getAtomicLong("test");
		System.err.println(atomicLong.getAndAdd(10));
		atomicLong.incrementAndGet();
		System.err.println("addAndGet:"+atomicLong.addAndGet(5));
		System.err.println("decrementAndGet:"+atomicLong.decrementAndGet());
		System.err.println("getAndDecrement:"+atomicLong.getAndDecrement());
		System.err.println("获取的分布式uuid是:" + atomicLong.get());
		atomicLong.set(0);
		System.err.println(atomicLong.isExists());
		atomicLong.delete();
		System.err.println(atomicLong.isExists());
		System.err.println("createNo:"+SerialNo.createContractNo("apple"));
		/*test("***********testDistLockAop", 99);
		TimeUnit.SECONDS.sleep(20);*/
		return Boolean.TRUE;
	}
	
	
	private synchronized String  create(String keyPref){
		RAtomicLong atomicLong = redissonClient.getAtomicLong("test");
		atomicLong.incrementAndGet();
		long val=atomicLong.get();
		return "";
	}

	public void test(@RedisLockKey(order = 1) String key, @RedisLockKey(order = 0) Integer key1) {
		i++;
		System.out.println("i=***************************************" + i);
	}

	/**
	 * 测试redisLock
	 * 
	 * @return
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = "/redisLock")
	@ResponseBody
	@RedisLock(lockKey = "lockKey")
	public boolean redisLock(@RedisLockKey(order = 1) String key, @RedisLockKey(order = 0) int key1) throws InterruptedException {
		/*RLock fairLock = redissonClient.getFairLock("anyLock");
		try {
			// 最常见的使用方法
			fairLock.lock();
			// 支持过期解锁功能, 10秒钟以后自动解锁,无需调用unlock方法手动解锁
			fairLock.lock(10, TimeUnit.SECONDS);
			// 尝试加锁，最多等待20秒，上锁以后10秒自动解锁
			if (fairLock.tryLock(20, 10, TimeUnit.SECONDS)) {
				System.err.println("======成功获得锁======");
				RAtomicLong atomicLong = redissonClient.getAtomicLong("test");
				atomicLong.incrementAndGet();
				System.err.println("获取的分布式uuid是:" + atomicLong.get());
				System.err.println("业务逻辑执行完毕");
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		} finally {
			fairLock.unlock();
		}*/
	    System.err.println("开始执行业务逻辑");
		TimeUnit.SECONDS.sleep(20);
		System.err.println("业务逻辑执行完毕");
		return true;
	}

	/**
	 * 页面初始化
	 * 
	 * @throws InterruptedException
	 */
	@RequestMapping("/init")
	public String init(HttpServletRequest request) throws InterruptedException {
	    /*RedissonManager.init(); // 初始化
		String key = "test123";
		DistributedRedisLock.acquire(key);
		System.err.println("======成功获得锁======");
		System.err.println("获取的分布式uuid是:" + RedissonManager.UUID());
		DistributedRedisLock.release(key);
		System.err.println("成功释放锁");*/
		System.err.println(request.getMethod());
		System.err.println(mailInfo);
		System.err.println("环境是:"+mailInfo.get("system.run.info"));
		/*System.err.println(ConfigUtils.getString("qrcode.logo"));
		System.err.println(ConfigUtils.getString("remoting.isecbiz.host"));
		System.err.println(ConfigUtils.getString("redis.port"));
		System.err.println(ConfigUtils.getString("mail.password"));*/
		System.err.println("==================================================");
		return "solr/selectSolr";
	}

	/**
	 *  简单测试
	 */
	@RequestMapping(value = "/{id}",method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<Solr> getUserById (@PathVariable("id") String id){
		Solr result = solrService.view("17120909394435959475");
	    /*HttpStatus status = result != null ? HttpStatus.OK : HttpStatus.NOT_FOUND;*/
	    HttpStatus status = result == null ? HttpStatus.OK : HttpStatus.NOT_FOUND;
	    return new ResponseEntity<Solr>(result,status);
	}
	
	@RequestMapping("/status")  
    public ResponseEntity<String> responseEntityStatusCode() {  
        return new ResponseEntity<String>("The String ResponseBody with custom status code (403 Forbidden)",  HttpStatus.FORBIDDEN);   
    }  
	
	
	/**
	 * 分页查询数据
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = "/selectPage", method = RequestMethod.POST)
	@ResponseBody
	@Function("solr分页")
	@RedisLock(lockKey = "lockKey")
	public Map<String, Object> selectPage(@RequestBody Solr entity,HttpServletRequest request) throws InterruptedException {
		/*test("***********testDistLockAop", 99);
		TimeUnit.SECONDS.sleep(20);*/
		System.err.println(request.getMethod());
		return responseSelectPage(solrService.selectPage(entity));
	}

	/**
	 * 跳转添加
	 */
	@RequestMapping(value = "/preInsert", method = RequestMethod.GET)
	public String preInsert(HttpServletRequest req) {
		return "solr/insertSolr";
	}

	/**
	 * 添加数据
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.PUT)
	@ResponseBody
	@Function("solr添加")
	public Boolean insert(@RequestBody Solr entity) {
		entity.setId(SerialNo.getUNID());
		return solrService.insert(entity) > 0 ? Boolean.TRUE : Boolean.FALSE;
	}

	/**
	 * 跳转更新
	 */
	@RequestMapping(value = "/preUpdate", method = RequestMethod.GET)
	public String preUpdate(HttpServletRequest request) {
		request.setAttribute("solr", solrService.view(request.getParameter("id")));
		return "solr/updateSolr";
	}

	/**
	 * 更新数据
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	@Function("solr更新")
	public Boolean update(Solr entity) {
		return solrService.update(entity) > 0 ? Boolean.TRUE : Boolean.FALSE;
	}

	/**
	 * 删除数据
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	@Function("solr删除")
	public Boolean delete(@RequestBody List<Solr> ids) {
		return solrService.batchDelete(ids) > 0 ? Boolean.TRUE : Boolean.FALSE;
	}

	@RequestMapping("/test")
	@ResponseBody
	@Function("solr测试")
	public Boolean test() {
		int i = 11000;
		do {
			Solr entity = new Solr();
			entity.setId(SerialNo.getUNID());
			entity.setCreatetime(new Date());
			entity.setName("test" + i);
			entity.setTitle("title" + i);
			entity.setPrice(i);
			solrService.insert(entity);
			i--;
		} while (i > 1000);
		return Boolean.TRUE;
	}
	public static void main(String[] args) {
		System.err.println((int)'H');
		System.err.println((int)'L');
		System.err.println((int)'D');
		System.err.println(((int)'W'+(int)'A'+(int)'P')/3);
		//72 花乐贷
		//76 连连
		//77 WAP  6位
		//20171124122535
		System.err.println(System.currentTimeMillis());//13位
		//19位
		System.err.println(getLen(99999));
	    Scanner scan = new Scanner(System.in);
		String read = scan.nextLine();
		int a=Integer.valueOf(read);//redis拿取的整数
		String s=String.valueOf(a);
		if(getLen(a)>6){
			s=RandomStringUtils.randomNumeric(6);
		}else if(getLen(a)==6){//刚好6位
		}else{//不足六位数,数字前面补上0  123-->000123
           System.err.println(6-getLen(a));
           for (int i = 0; i < 6-getLen(a); i++) {
			 s="0"+s;
		   }
		}
		/*System.err.println("727677"+System.currentTimeMillis()+s);
	    System.err.println(RandomStringUtils.randomNumeric(6));*/
		
        /*System.err.println(getLen(Integer.parseInt(read)));*/
        
        System.err.println("267"+System.currentTimeMillis()+99);
        
        System.err.println("位数:"+getLen(Long.MAX_VALUE));
          
	 }
	
	public static int getLen(long x){
	     if(x<10) return 1;
	     return getLen(x/10)+1;
	}
	
	public static int getLen(int x){
	     if(x<10) return 1;
	     return getLen(x/10)+1;
	}
	
	public static synchronized String getUNID(RedissonClient redissonClient,String cacheKey) {
		RAtomicLong atomicLong = redissonClient.getAtomicLong(cacheKey);
		atomicLong.incrementAndGet();
		return "727677"+System.currentTimeMillis()+atomicLong.get();
	}
	
}
