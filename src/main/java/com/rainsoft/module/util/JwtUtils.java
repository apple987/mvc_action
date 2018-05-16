package com.rainsoft.module.util;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeSet;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.ObjectUtils;

import com.rainsoft.core.RRException;
import com.rainsoft.core.shiro.redis.SerializeUtils;
import com.rainsoft.mvc.test.User;
import com.rainsoft.util.AESUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisPool;

/**
 * jwt工具类
 *  也可以考虑,采用redis做tonken生成
 *  采用token实现,服务器无状态,分布式等方式都方便
 *  
 *   比如说第一次生成一个token，虽然token还没有过期，但是第二次继续登录，又重新生成一个token
 *    这就会导致，相同账户两个token都是有效的，那么获取数据的时候，使用第一次生成的token，也可以拿到数据吗？
 *         这显然不合适，这里需要加一个处理
 *         简单点就是以最后一次登录生成的token为有效，生成最后一次token时，销毁当前账户，以前的token，保证最后一次登录的token才有效果
 *  
 */
public class JwtUtils {
    private Logger logger = LoggerFactory.getLogger(getClass());
    
    private String secret;
    
    private long expire;
    
    private String header;
    
	@Autowired
	private JedisCluster jedisCluster;
  

    /**
     * 生成jwt token
     */
    public String generateToken(long userId) {
        Date nowDate = new Date();
        //过期时间
        Date expireDate = new Date(nowDate.getTime() + expire * 1000);
        /*销毁当前账户，本次登录之前的token信息*/
    	TreeSet<String> ts = keys("*");
		Iterator<String> it = ts.iterator();
		while (it.hasNext()) {
			String key=it.next();
			User usr=get(key.getBytes(), User.class);
			if(!ObjectUtils.isEmpty(usr)&&StringUtils.isNotEmpty(usr.getName())&&usr.getName().equals(String.valueOf(userId))){
				jedisCluster.del(key);
			}
		}
		String token= Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .setSubject(userId+"")
                .setIssuedAt(nowDate)
                .setExpiration(expireDate)
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
		return AESUtil.encrypt(token, null);
    }
    
    /**
     * 验证token
     * @param token
     * @return
     */
    public Claims getClaimByToken(String token) {
        try {
        	token=AESUtil.decrypt(token, null);
            return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        }catch (Exception e){
            logger.debug("validate is token error ", e);
            return null;
        }
    }

    /**
     * token是否过期
     * @return  true：过期
     */
    public boolean isTokenExpired(Date expiration) {
        return expiration.before(new Date());
    }

	
    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public long getExpire() {
        return expire;
    }

    public void setExpire(long expire) {
        this.expire = expire;
    }

    public String getHeader() {
        return header;
    }
    
    public void setHeader(String header) {
        this.header = header;
    }
    
    
    /**
	 * 获取集群keys
	 */
	public TreeSet<String> keys(String pattern) {
		logger.info("开始JwtUtils.keys获取集群keys传入表达式:" + pattern);
		TreeSet<String> keys = new TreeSet<>();
		Map<String, JedisPool> clusterNodes = jedisCluster.getClusterNodes();
		for (String k : clusterNodes.keySet()) {
			JedisPool jedisPool = clusterNodes.get(k);
			Jedis jedis = jedisPool.getResource();
			try {
				keys.addAll(jedis.keys(pattern));
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("执行JwtUtils.keys获取集群keys异常:" + e);
				throw new RRException(e.toString(), HttpStatus.INTERNAL_SERVER_ERROR.value());
			} finally {
				if (jedis != null) {
					jedis.close();// 用完一定要close这个链接！！！
				}
			}
		}
		return keys;
	}
	
	/**
	 * 判断key是不是存在
	 */
	public  Boolean exists(String key) {
		return jedisCluster.exists(key);
	}
	
	/**
	 * 设置元素 存活时间
	 *  存入序列化对象
	 */
	public String set(byte[] key, int timeout, Object value) {
		return jedisCluster.setex(key, timeout, SerializeUtils.serialize(value));
	}
	
	/**
	 * 根据Key获取元素
	 *  针对存入序列化对象
	 */
	@SuppressWarnings("unchecked")
	public <T> T get(byte[] key, Class<T> type) {
		return (T) SerializeUtils.deserialize(jedisCluster.get(key));
	}
}
