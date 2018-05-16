package com.rainsoft.mvc.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.DataInterrupt;
import com.rainsoft.mvc.model.Staff;
import com.rainsoft.mvc.service.DataInterruptService;

@SuppressWarnings("unchecked")
@Service("dataInterruptService")
public class DataInterruptServiceImpl implements DataInterruptService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "baseDao")
	private BaseDao baseDao;
	
	@Resource(name = "commonDao")
	private BaseDao commonDao;

	@Resource(name = "jmsQueueTemplate")
	private JmsTemplate jmsTemplate;
	
	/**
	 * 删除
	 */
	@Override
	public int delete(Object pk) {
		return baseDao.delete("com.rainsoft.mvc.mapper.DataInterrupt.delete", pk);
	}

	/**
	 * 批量删除
	 */
	@Override
	public int delete(String[] pk_array) {
		for (String pk : pk_array) {
			baseDao.delete("com.rainsoft.mvc.mapper.DataInterrupt.delete", pk);
		}
		return pk_array.length;
	}

	/**
	 * 新增
	 */
	@Override
	public DataInterrupt insert(DataInterrupt object) {
		baseDao.insert("com.rainsoft.mvc.mapper.DataInterrupt.insert", object);
		Staff st=new Staff();
		st.setPkid("123456");
		st.setAge(20);
		st.setCreateby("张三丰");
		st.setSex("1");
		st.setSname("陈慧君");
		st.setCreateDate(new Date());
		commonDao.insert("com.rainsoft.mvc.mybatis.Staff.insert", st);
		String msg="测试添加数据时JTA事务,JMS整合";
		System.out.println(Thread.currentThread().getName() + " 向队列" + jmsTemplate.getDefaultDestination().toString() + "发送消息---------------------->" + msg);
		jmsTemplate.send(new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(msg);
			}
		});
		return object;
	}

	/**
	 * 分页查询
	 */
	@Override
	public PageList<DataInterrupt> selectPage(Map<String, Object> params) {
		logger.debug("开始执行[selectPage] 参数:params=>[" + params + "]");
		PageList<DataInterrupt> pg = baseDao.selectPage("com.rainsoft.mvc.mapper.DataInterrupt.select", params);
		logger.debug("结束执行[selectPage] 返回:[" + JSON.toJSONStringWithDateFormat(pg,"yyyy-MM-dd HH:mm:ss"));
		return pg;
	}
	
	/**
	 * 分页查询
	 */
	@Override
	public PageList<DataInterrupt> selectPage(DataInterrupt params) {
		logger.debug("开始执行[selectPage] 参数:params=>[" + params + "]");
		PageList<DataInterrupt> pg = baseDao.selectPage("com.rainsoft.mvc.mapper.DataInterrupt.select", params);
		logger.debug("结束执行[selectPage] 返回:[" + JSON.toJSONStringWithDateFormat(pg,"yyyy-MM-dd HH:mm:ss"));
		return pg;
	}

	/**
	 * 更新
	 */
	@Override
	public DataInterrupt update(DataInterrupt object) {
		baseDao.update("com.rainsoft.mvc.mapper.DataInterrupt.update", object);
		return object;
	}

	/**
	 * 浏览单个
	 */
	@Override
	public DataInterrupt view(String pk) {
		return (DataInterrupt) baseDao.view("com.rainsoft.mvc.mapper.DataInterrupt.view", pk);
	}

	/**
	 * 查询对象
	 */
	@Override
	public DataInterrupt queryBean(DataInterrupt object) {
		return (DataInterrupt) baseDao.selectOne("com.rainsoft.mvc.mapper.DataInterrupt.queryBean", object);
	}

	/**
	 * 根据查询条件查询
	 */
	@Override
	public List<?> queryData(Map<?, ?> mp) {
		return baseDao.selectList("com.rainsoft.mvc.mapper.DataInterrupt.selectDataTest", mp);
	}

	@Override
	public Map<String, Object> testCase(Map<?, ?> mp) {
		return (Map<String, Object>) baseDao.selectOne("com.rainsoft.mvc.mapper.DataInterrupt.selectTestCase", mp);
	}

	@Override
	public List<?> selectList(Map<?, ?> mp) {
		return baseDao.selectList("com.rainsoft.mvc.mapper.DataInterrupt.select", mp);
	}

}
