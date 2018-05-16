package com.rainsoft.core.shiro.redis;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.rainsoft.constant.Constants;
import com.rainsoft.util.CoreUtil;
import com.rainsoft.util.SessionUtil;


/**
 * 采用redis重写shiro的sessionDao
 */
public class RedisSessionDAO extends AbstractSessionDAO {

	private static Logger logger = LoggerFactory.getLogger(RedisSessionDAO.class);
	/**
	 * shiro-redis的session对象前缀
	 */
	private RedisManager redisManager;
	
	/**
	 * The Redis key prefix for the sessions 
	 */
	private String keyPrefix = Constants.ShiroRedisKey.RedisSessionDAO;
	/**
	 * 每次请求shiro都会更新最后访问时间，导致调用此方法，由于使用了redis缓存， 
	 * 那么如果静态资源很多会导致短时间内大量更新redis缓存
	 * 但是这是不需要的，只有在访问controller请求时才需要更新session
	 * 
	 */
	@Override
	public void update(Session session) throws UnknownSessionException {
		HttpServletRequest request=SessionUtil.getRequest();
		if(isStaticUrl(request.getRequestURI())){
			this.saveSession(session);
		}
	}
	
	/**
	 * save session
	 * @param session
	 * 存入当前项目的web路径
	 *  便于集群区分不同项目
	 *  IP地址可能不一样，访问时可能一个是域名，一个是IP
	 * @throws UnknownSessionException
	 */
	private void saveSession(Session session) throws UnknownSessionException{
		if(session == null || session.getId() == null){
			logger.error("session or session id is null");
			return;
		}
		HttpServletRequest request =  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		session.setAttribute(Constants.CURRENT_WEB_PROJECT, basePath);
		byte[] key = getByteKey(session.getId());
		byte[] value = SerializeUtils.serialize(session);
		session.setTimeout(redisManager.getExpire()*1000);		
		this.redisManager.set(key, value, redisManager.getExpire());
	}
	
	@Override
	public void delete(Session session) {
		if(session == null || session.getId() == null){
			logger.error("session or session id is null");
			return;
		}
		redisManager.del(this.getByteKey(session.getId()));
	}
    /**
     * 统计在线活跃session总数
     * A.去掉redis服务器中存在符合key规则，但是不能正常反序列化的元素
     * B.去掉redis服务器中已经过期的session元素。
     * C.redis服务器中存在session，但是并没有执行登录或登录不成功
     *   session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY)
     *   [C]情况目前不好在此处界定，所以本处getActiveSessions()就不处理这个问题 
     */
	@Override
	public Collection<Session> getActiveSessions() {
		Set<Session> sessions = new HashSet<Session>();
		Set<byte[]> keys = redisManager.keys(this.keyPrefix + "*");
		if(keys != null && keys.size()>0){
			for(byte[] key:keys){
				Session s = (Session)SerializeUtils.deserialize(redisManager.get(key));
				if(CoreUtil.isEmpty(s)){//过滤掉自己造的符合前缀规则的垃圾session
					redisManager.del(key);
				}else{//过滤掉过期
					if(s.getTimeout()==0){
						this.delete(s);
					}else{
						sessions.add(s);
					}
				}
			}
		}
		return sessions;
	}
    /**
     * 创建session时，sessionId去掉
     *  JavaUuidSessionIdGenerator生成的UUID.randomUUID().toString();
     *  其中的-并全部转换成大写
     */
	@Override
	protected Serializable doCreate(Session session) {
		Serializable sessionId = this.generateSessionId(session).toString().toUpperCase().replaceAll("-", "");  
        this.assignSessionId(session, sessionId);
        this.saveSession(session);
		return sessionId;
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
		if(sessionId == null){
			logger.error("session id is null");
			return null;
		}
		Session s = (Session)SerializeUtils.deserialize(redisManager.get(this.getByteKey(sessionId)));
		return s;
	}
	
	/**
	 * 获得byte[]型的key
	 * @param key
	 * @return
	 */
	private byte[] getByteKey(Serializable sessionId){
		String preKey = this.keyPrefix + sessionId;
		return preKey.getBytes();
	}

	public RedisManager getRedisManager() {
		return redisManager;
	}

	public void setRedisManager(RedisManager redisManager) {
		this.redisManager = redisManager;
		
		/**
		 * 初始化redisManager
		 */
		this.redisManager.init();
	}

	/**
	 * Returns the Redis session keys
	 * prefix.
	 * @return The prefix
	 */
	public String getKeyPrefix() {
		return keyPrefix;
	}

	/**
	 * Sets the Redis sessions key 
	 * prefix.
	 * @param keyPrefix The prefix
	 */
	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}
	/**
	 * 判断请求URL路径
	 * 是否为静态资源
	 */
	private boolean isStaticUrl(String url){
		return url.indexOf("/static/")==-1;
	}
}
