package com.rainsoft.core.shiro.redis;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rainsoft.constant.Constants;

/**
 * 
 *shiro-redis-cacheManager
 */
public class RedisCacheManager implements CacheManager {

	private static final Logger logger = LoggerFactory
			.getLogger(RedisCacheManager.class);

	// fast lookup by name map
	@SuppressWarnings("rawtypes")
	private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap<String, Cache>();

	private RedisManager redisManager;

	/**
	 * The Redis key prefix for caches 
	 */
	private String keyPrefix = Constants.ShiroRedisKey.RedisCacheManager;
	
	
	
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
	
	@SuppressWarnings("unchecked")
	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		logger.debug("获取名称为: " + name + " 的RedisCache实例");
		@SuppressWarnings("rawtypes")
		Cache c = caches.get(name);
		if (c == null) {
			// initialize the Redis manager instance
			redisManager.init();
			// create a new cache instance
			c = new RedisCache<K, V>(redisManager, keyPrefix+name+":");
			/*c = new RedisCache<K, V>(redisManager, keyPrefix,name);*/
			// add it to the cache collection
			caches.put(name, c);
		}
		return c;
	}

	public RedisManager getRedisManager() {
		return redisManager;
	}

	public void setRedisManager(RedisManager redisManager) {
		this.redisManager = redisManager;
	}

}
