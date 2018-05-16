package com.rainsoft.mvc.service.impl;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSON;
import java.util.List;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.ClientUser;
import com.rainsoft.mvc.service.ClientUserService;

/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-12-28 09:14:09
 */

@Service("clientUserService")
public class ClientUserServiceImpl implements ClientUserService{

    static  Logger log=LoggerFactory.getLogger(ClientUserServiceImpl.class);
    
    @Resource(name = "baseDao")
	private BaseDao baseDao;
       
	
	
	/**
	 * 分页查询
	 */
	@Override
	public PageList<ClientUser> selectPage(ClientUser object) {
	   log.info("执行ClientUserServiceImpl.selectPage参数：entity==>" +JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
       return baseDao.selectPage("com.rainsoft.mvc.mapper.ClientUser.select", object);
	}

	/**
	 * 新增
	 */
	@Override
	public int insert(ClientUser object) {
		log.info("ClientUserServiceImpl.insert参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.insert("com.rainsoft.mvc.mapper.ClientUser.insert", object);
	}

	/**
	 * 修改
	 */
	@Override
	public int update(ClientUser object){
		log.info("执行ClientUserServiceImpl.update参数： entity==>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.update("com.rainsoft.mvc.mapper.ClientUser.update", object);
	}

	/**
	 * 浏览单个
	 */
	@Override
	public ClientUser view(String pk) {
		log.info("执行ClientUserServiceImpl.view参数： pk=>" + pk);
        return (ClientUser)baseDao.view("com.rainsoft.mvc.mapper.ClientUser.view", pk);
	} 
	
    /**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public ClientUser query(ClientUser object){
		log.info("执行ClientUserServiceImpl.query参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return (ClientUser)baseDao.selectOne("com.rainsoft.mvc.mapper.ClientUser.query", object);
	}
	 
    /**
	 * 查询集合
	 * @param object
	 * @return
	 */
	@Override
	public List<ClientUser> selectList(ClientUser object) {
		log.info("执行ClientUserServiceImpl.selectList参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.selectList("com.rainsoft.mvc.mapper.ClientUser.select", object);
	}
	
    /**
	 * 删除
	 * @param pk
	 * @return
	 */
	@Override
	public int delete(String pk) {
		log.info("执行ClientUserServiceImpl.delete参数： pk=>" + pk);
		return baseDao.delete("com.rainsoft.mvc.mapper.ClientUser.delete", pk);
	}
    /**
	 * 批量修改
	 * @param object
	 */
	@Override
	public int batchUpdate(List<ClientUser> object) {
		log.info("执行ClientUserServiceImpl.batchUpdate参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchUpdate("com.rainsoft.mvc.mapper.ClientUser.batchUpdate", object);
	}
	
    /**
	 * 批量插入
	 * @param object
	 */
	@Override
	public int batchInsert(List<ClientUser> object) {
	     log.info("执行ClientUserServiceImpl.batchInsert参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
         return baseDao.batchInsert("com.rainsoft.mvc.mapper.ClientUser.batchInsert", object);
	}
	
    /**
	 * 批量删除
	 */
	@Override
	public int batchDelete(List<ClientUser> pkList) {
		log.info("执行ClientUserServiceImpl.batchDelete参数： pkList=>" + JSON.toJSONStringWithDateFormat(pkList, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchDelete("com.rainsoft.mvc.mapper.ClientUser.batchDelete", pkList);
	}   
	
}
