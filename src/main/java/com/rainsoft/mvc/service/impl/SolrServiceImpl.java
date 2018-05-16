package com.rainsoft.mvc.service.impl;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Solr;
import com.rainsoft.mvc.model.Staff;
import com.rainsoft.mvc.service.SolrService;

/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-09-21 01:44:38
 */

@Service("solrService")
public class SolrServiceImpl implements SolrService{

    static  Logger log=LoggerFactory.getLogger(SolrServiceImpl.class);
    
    @Resource(name = "baseDao")
	private BaseDao baseDao;
       
    @Resource(name = "commonDao")
	private BaseDao commonDao;
    
    
    @Resource(name = "jmsQueueTemplate")
	private JmsTemplate jmsTemplate;
	
    
	/**
	 * 分页查询
	 */
	@Override
	public PageList<Solr> selectPage(Solr object) {
	   log.info("执行SolrServiceImpl.selectPage参数：entity==>" +JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
       return baseDao.selectPage("com.rainsoft.mvc.mapper.Solr.select", object);
	}

	/**
	 * 新增
	 */
	@Override
	public int insert(Solr object) {
		log.info("SolrServiceImpl.insert参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.insert("com.rainsoft.mvc.mapper.Solr.insert", object);
	}

	/**
	 * 修改
	 */
	@Override
	public int update(Solr object){
		log.info("执行SolrServiceImpl.update参数： entity==>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
		List<Staff> arr=commonDao.selectList("com.rainsoft.mvc.mybatis.Staff.select", null);
		String msg="测试更新数据时JTA事务,JMS整合";
		System.out.println(Thread.currentThread().getName() + " 向队列" + jmsTemplate.getDefaultDestination().toString() + "发送消息---------------------->" + msg);
		jmsTemplate.send(new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(msg);
			}
		});
		if(!CollectionUtils.isEmpty(arr)){
			Staff st=arr.get(0);
			st.setSex(null);
			commonDao.update("com.rainsoft.mvc.mybatis.Staff.update", st);
		}
        return baseDao.update("com.rainsoft.mvc.mapper.Solr.update", object);
	}

	/**
	 * 浏览单个
	 */
	@Override
	public Solr view(String pk) {
		log.info("执行SolrServiceImpl.view参数： pk=>" + pk);
        return (Solr)baseDao.view("com.rainsoft.mvc.mapper.Solr.view", pk);
	} 
	
    /**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public Solr query(Solr object){
		log.info("执行SolrServiceImpl.query参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return (Solr)baseDao.selectOne("com.rainsoft.mvc.mapper.Solr.query", object);
	}
	 
    /**
	 * 查询集合
	 * @param object
	 * @return
	 */
	@Override
	public List<Solr> selectList(Solr object) {
		log.info("执行SolrServiceImpl.selectList参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.selectList("com.rainsoft.mvc.mapper.Solr.select", object);
	}
	
    /**
	 * 删除
	 * @param pk
	 * @return
	 */
	@Override
	public int delete(String pk) {
		log.info("执行SolrServiceImpl.delete参数： pk=>" + pk);
		int res=baseDao.delete("com.rainsoft.mvc.mapper.Solr.delete", pk);
		commonDao.delete("com.rainsoft.mvc.mybatis.Staff.delete1", pk);
		String msg="测试更新数据时JTA事务,JMS整合";
		System.out.println(Thread.currentThread().getName() + " 向队列" + jmsTemplate.getDefaultDestination().toString() + "发送消息---------------------->" + msg);
		jmsTemplate.send(new MessageCreator() {
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(msg);
			}
		});
		return res;
	}
    /**
	 * 批量修改
	 * @param object
	 */
	@Override
	public int batchUpdate(List<Solr> object) {
		log.info("执行SolrServiceImpl.batchUpdate参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchUpdate("com.rainsoft.mvc.mapper.Solr.batchUpdate", object);
	}
	
    /**
	 * 批量插入
	 * @param object
	 */
	@Override
	public int batchInsert(List<Solr> object) {
	     log.info("执行SolrServiceImpl.batchInsert参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
         return baseDao.batchInsert("com.rainsoft.mvc.mapper.Solr.batchInsert", object);
	}
	
    /**
	 * 批量删除
	 */
	@Override
	public int batchDelete(List<Solr> pkList) {
		log.info("执行SolrServiceImpl.batchDelete参数： pkList=>" + JSON.toJSONStringWithDateFormat(pkList, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchDelete("com.rainsoft.mvc.mapper.Solr.batchDelete", pkList);
	}   
	
}
