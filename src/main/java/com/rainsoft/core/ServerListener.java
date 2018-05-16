package com.rainsoft.core;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;*/
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.util.SpringContextUtil;

public class ServerListener implements ServletContextListener {
	/*protected final Logger logger = LogManager.getLogger();*/
	static  Logger logger=LoggerFactory.getLogger(ServerListener.class);

	public void contextDestroyed(ServletContextEvent contextEvent) {
	}

	public void contextInitialized(ServletContextEvent contextEvent) {
		logger.info("=================================");
		logger.info("系统[{}]启动完成!!!", contextEvent.getServletContext().getServletContextName());
		ApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(contextEvent.getServletContext());
		BaseDao baseDao=(BaseDao) ctx.getBean("baseDao");
		logger.info("ApplicationContext执行查询结果是:"+JSON.toJSONString(baseDao.view("com.rainsoft.mvc.mapper.Solr.view", "17120909394435959475")));
		BaseDao baseDao1= (BaseDao) SpringContextUtil.getBean("baseDao");
		logger.info("SpringContextUtil执行查询结果是:"+JSON.toJSONString(baseDao1.view("com.rainsoft.mvc.mapper.Solr.view", "17120909394435959475")));
		logger.info("ApplicationContext获取BaseDao跟SpringContextUtil获取baseDao，相同实例吗？"+(baseDao==baseDao1));
		logger.info("=================================");
	}
}