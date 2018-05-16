package com.rainsoft.core.shiro.redis;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.rainsoft.constant.Constants;



/**
 * 自定义shiroSession工具类
 */
public class SessionUtils {
	private static Logger logger = LoggerFactory.getLogger(SessionUtils.class);
	private SessionDAO sessionDAO;
	private RedisManager redisManager;
	private String keyPrefix = Constants.ShiroRedisKey.RedisSessionDAO;

	/**
	 * 同步更新时候shiroSession 内容跟redis存储session内容
	 */
	public void update(Session session) throws UnknownSessionException {
		if (session == null || session.getId() == null) {
			return;
		}
		byte[] key = getByteKey(session.getId());
		byte[] value = SerializeUtils.serialize(session);
		session.setTimeout(redisManager.getExpire() * 1000);
		this.redisManager.set(key, value, redisManager.getExpire());
	}

	/**
	 * 同步更新时候shiroSession 内容跟redis存储session内容
	 */
	public void update(Session session, int timeout) throws UnknownSessionException {
		if (session == null || session.getId() == null) {
			return;
		}
		byte[] key = getByteKey(session.getId());
		byte[] value = SerializeUtils.serialize(session);
		session.setTimeout(timeout * 1000);
		this.redisManager.set(key, value, timeout);
	}
	

	/**
	 * 同步更新时候shiroSession 内容跟redis存储session内容
	 */
	public void update(Serializable sessionId) throws UnknownSessionException {
		Session session = readSession(sessionId);
		if (session == null || session.getId() == null) {
			return;
		}
		byte[] key = getByteKey(session.getId());
		byte[] value = SerializeUtils.serialize(session);
		session.setTimeout(redisManager.getExpire() * 1000);
		this.redisManager.set(key, value, redisManager.getExpire());
	}

	/**
	 * 同步更新时候shiroSession 内容跟redis存储session内容
	 */
	public void update(Serializable sessionId, int timeout) throws UnknownSessionException {
		Session session = readSession(sessionId);
		if (session == null || session.getId() == null) {
			return;
		}
		byte[] key = getByteKey(session.getId());
		byte[] value = SerializeUtils.serialize(session);
		session.setTimeout(timeout);
		this.redisManager.set(key, value, timeout);
	}

	/**
	 * 获得session
	 */
	public Session readSession(Serializable sessionId) {
		if (sessionId == null) {
			logger.error("session id is null");
			return null;
		}
		Session s = (Session) SerializeUtils.deserialize(redisManager.get(this.getByteKey(sessionId)));
		return s;
	}
	/**
	 * 最好不要直接删除session
	 * 允许时，可能报根据sessionId找不到session
	 * 推荐重置shiroSession和redis中session
	 * 到期时间为1秒
	 */
	public void delete(Session session){
		if (!isEmpty(session)) {
			session.setTimeout(1);//1ms
			sessionDAO.delete(session);
		}
	}
	
	
	
	/**
	 * 获取活跃session数
	 * 例外session列表：
	 *  1.没有存储登录账户DefaultSubjectContext.PRINCIPALS_SESSION_KEY
	 *  2.存储的强剔信息是Constants.SESSION_FORCE_LOGOUT_KEY：
	 *     1:页面强制剔除
	 *     2:后来登陆账户剔除前者
	 *     3.其他表示正常登录 
	 *     废弃 4.session创建时，默认会在session中加上nginx.web.group信息来区分多项目集群时，区分项目的功能
	 */
	public Collection<Session> getActiveSessions() {
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		HttpServletRequest request =  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String webName=request.getContextPath();
		//不符合规则session列表:
		List<Session> tempSessionList = new ArrayList<Session>();
		for (Session session : sessions) {
			if (!isEmpty(session)){
				//非本项目的session
				if(isEmpty(session.getAttribute(Constants.CURRENT_WEB_PROJECT))
				   ||!getNotNullStr(session.getAttribute(Constants.CURRENT_WEB_PROJECT)).endsWith(webName)){
					tempSessionList.add(session);
				}else{//本项目不符合要求的session
					if(isEmpty(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY))
					   ||!isEmpty(session.getAttribute(Constants.SESSION_FORCE_LOGOUT_KEY))) {
						tempSessionList.add(session);
					} 
				}
			} else {
				tempSessionList.add(session);
			}
		}
		/**
		 * 直接在上面sessions循环时，删除某些违规session项目报以下异常
		 * Java.util.ConcurrentModificationException
		 * 所以采用tempSessionList暂存无用垃圾session
		 */
		for (int i = 0; i < tempSessionList.size(); i++) {
			Session session = tempSessionList.get(i);
			sessions.remove(session);
		}
		return sessions;
	}

	private byte[] getByteKey(Serializable sessionId) {
		String preKey = this.keyPrefix + sessionId;
		return preKey.getBytes();
	}

	public SessionUtils(SessionDAO sessionDAO, RedisManager redisManager) {
		super();
		this.sessionDAO = sessionDAO;
		this.redisManager = redisManager;
	}

	public String getKeyPrefix() {
		return keyPrefix;
	}

	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}

	public SessionDAO getSessionDAO() {
		return sessionDAO;
	}

	public void setSessionDAO(SessionDAO sessionDAO) {
		this.sessionDAO = sessionDAO;
	}

	public RedisManager getRedisManager() {
		return redisManager;
	}

	public void setRedisManager(RedisManager redisManager) {
		this.redisManager = redisManager;
	}

	private boolean isEmpty(Object obj) {
		return obj == null || obj.toString().trim().equals("") || obj.toString().trim().length() == 0;
	}
	private String getNotNullStr(Object obj){
		return isEmpty(obj)?"":obj.toString();
	}
	/**
	 * shiro设置参数
	 */
	public static void setShiroObject(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
	/**
	 * shiro获取session参数
	 */
	public static Object getShiroObject(Object key) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
			    return 	session.getAttribute(key);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
}
