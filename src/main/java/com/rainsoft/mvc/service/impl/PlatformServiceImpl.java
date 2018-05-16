package com.rainsoft.mvc.service.impl;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.alibaba.fastjson.JSON;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Platform;
import com.rainsoft.mvc.service.PlatformService;

import java.util.List;

/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-07-11 11:01:20
 */

@Service("platformService")
public class PlatformServiceImpl implements PlatformService{

    static  Logger log=LoggerFactory.getLogger(PlatformServiceImpl.class);
    
    @Resource(name = "baseDao")
	private BaseDao baseDao;
       
	
	
	/**
	 * 分页查询
	 */
	@Override
	public PageList<Platform> selectPage(Platform object) {
	   log.info("执行PlatformServiceImpl.selectPage参数：entity==>" +JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
       return baseDao.selectPage("com.rainsoft.mvc.mapper.Platform.select", object);
	}

	/**
	 * 新增
	 */
	@Override
	public int insert(Platform object) {
		log.info("PlatformServiceImpl.delete参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.insert("com.rainsoft.mvc.mapper.Platform.insert", object);
	}

	/**
	 * 修改
	 */
	@Override
	public int update(Platform object){
		log.info("执行PlatformServiceImpl.update参数： entity==>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.update("com.rainsoft.mvc.mapper.Platform.update", object);
	}

	/**
	 * 浏览单个
	 */
	@Override
	public Platform view(Integer pk) {
		log.info("执行PlatformServiceImpl.view参数： pk=>" + pk);
        return (Platform)baseDao.view("com.rainsoft.mvc.mapper.Platform.view", pk);
	} 
	
    /**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public Platform query(Platform object){
		log.info("执行PlatformServiceImpl.query参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return (Platform)baseDao.selectOne("com.rainsoft.mvc.mapper.Platform.query", object);
	}
	 
    /**
	 * 查询集合
	 * @param object
	 * @return
	 */
	@Override
	public List<Platform> selectList(Platform object) {
		log.info("执行PlatformServiceImpl.selectList参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.selectList("com.rainsoft.mvc.mapper.Platform.select", object);
	}
	
    /**
	 * 删除
	 * @param pk
	 * @return
	 */
	@Override
	public int delete(String pk) {
		log.info("执行PlatformServiceImpl.delete参数： pk=>" + pk);
		return baseDao.delete("com.rainsoft.mvc.mapper.Platform.delete", pk);
	}
    /**
	 * 批量修改
	 * @param object
	 */
	@Override
	public int batchUpdate(List<Platform> object) {
		log.info("执行PlatformServiceImpl.batchUpdate参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchUpdate("com.rainsoft.mvc.mapper.Platform.batchUpdate", object);
	}
	
    /**
	 * 批量插入
	 * @param object
	 */
	@Override
	public int batchInsert(List<Platform> object) {
	     log.info("执行PlatformServiceImpl.batchInsert参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
         return baseDao.batchInsert("com.rainsoft.mvc.mapper.Platform.batchInsert", object);
	}
	
    /**
	 * 批量删除
	 */
	@Override
	public int batchDelete(List<Platform> pkList) {
		log.info("执行PlatformServiceImpl.batchDelete参数： pkList=>" + JSON.toJSONStringWithDateFormat(pkList, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchDelete("com.rainsoft.mvc.mapper.Platform.batchDelete", pkList);
	}   
	
}
