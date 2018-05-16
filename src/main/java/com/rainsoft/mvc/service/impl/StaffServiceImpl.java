package com.rainsoft.mvc.service.impl;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Staff;
import com.rainsoft.mvc.service.StaffService;

import java.util.List;

/**
 * TODO 本代码由代码生成工具生成
 * @author 付为地
 * @date 2017-04-17 10:00:04
 */

@Service("staffService")
public class StaffServiceImpl implements StaffService{

	private Log log = LogFactory.getLog(StaffServiceImpl.class);
     
	@Resource(name = "baseDao")
	private BaseDao baseDao;
       
	/**
	 * 删除
	 */
	@Override
	public int delete(String pk) {
		log.info("执行StaffServiceImpl.delete： pk=>" + pk);
		return baseDao.delete("com.rainsoft.mvc.mapper.Staff.delete", pk);
	}
	
	/**
	 * 批量删除
	 */
	@Override
	public int delete(String[] pk_array) {
        log.debug("执行StaffServiceImpl.delete： pk_array=>" + pk_array);
        for (String pk : pk_array) {
             log.debug(" pk=>" + pk);
             baseDao.delete("com.rainsoft.mvc.mapper.Staff.delete",pk_array);
        }
        return pk_array.length;
    }

	/**
	 * 新增
	 */
	@Override
	public int insert(Staff object) {
		 log.info("执行StaffServiceImpl.delete： object=>" + object);
         return baseDao.insert("com.rainsoft.mvc.mapper.Staff.insert",object);
	}

	/**
	 * 分页查询
	 */
	@Override
	public PageList<Staff> selectPage(Map<String, Object> params) {
		log.info("执行StaffServiceImpl.selectPage：params=>" + params);
        return baseDao.selectPage("com.rainsoft.mvc.mapper.Staff.select", params);
	}

	/**
	 * 更新
	 */
	@Override
	public int update(Staff object){
		log.info("执行StaffServiceImpl.update： object=>" + object);
        return baseDao.update("com.rainsoft.mvc.mapper.Staff.update",object);
	}

	/**
	 * 浏览单个
	 */
	@Override
	public Staff view(String pk) {
		log.info("执行StaffServiceImpl.view： pk=>" + pk);
        return (Staff) baseDao.view("com.rainsoft.mvc.mapper.Staff.view",pk);
	} 
	
    /**
	 * 根据查询条件查询
	 */
	@Override
	public List<?> selectList(Map<String, Object>  mp) {
		log.info("执行StaffServiceImpl.selectList： mp=>" + mp);
        return baseDao.selectList("com.rainsoft.mvc.mapper.Staff.select",mp);
	}
	
}
