package com.rainsoft.mvc.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Student;
import com.rainsoft.mvc.service.StudentService;

/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-07-09 05:33:39
 */

@Service("studentService")
public class StudentServiceImpl implements StudentService{

    static  Logger log=LoggerFactory.getLogger(StudentServiceImpl.class);
    
    @Resource(name = "baseDao")
	private BaseDao baseDao;
       
	
	
	/**
	 * 分页查询
	 */
	@Override
	public PageList<Student> selectPage(Student object) {
	   log.info("执行StudentServiceImpl.selectPage参数：entity==>" +JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
       return baseDao.selectPage("com.rainsoft.mvc.mapper.Student.select", object);
	}

	/**
	 * 新增
	 */
	@Override
	@CachePut(value="view",key="#object.getId()")
	public Student insert(Student object) {
		log.info("StudentServiceImpl.insert参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
		object.setOperateResult(baseDao.insert("com.rainsoft.mvc.mapper.Student.insert", object));
		return object;
	}

	/**
	 * 修改
	 */
	@Override
	@CacheEvict(value="view",key="#object.getId()")
	public Student update(Student object){
		log.info("执行StudentServiceImpl.update参数： entity==>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
		object.setOperateResult(baseDao.update("com.rainsoft.mvc.mapper.Student.update", object));
        return object;
	}

	/**
	 * 浏览单个
	 */
	@Override
	@Cacheable(value="view",key="#pk")
	public Student view(Integer pk) {
		log.info("执行StudentServiceImpl.view参数： pk=>" + pk);
        return (Student)baseDao.view("com.rainsoft.mvc.mapper.Student.view", pk);
	} 
	
    /**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public Student query(Student object){
		log.info("执行StudentServiceImpl.query参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return (Student)baseDao.selectOne("com.rainsoft.mvc.mapper.Student.query", object);
	}
	 
    /**
	 * 查询集合
	 * @param object
	 * @return
	 */
	@Override
	public List<Student> selectList(Student object) {
		log.info("执行StudentServiceImpl.selectList参数： entity=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.selectList("com.rainsoft.mvc.mapper.Student.select", object);
	}
	
    /**
	 * 删除
	 * @param pk
	 * @return
	 */
	@Override
	@CacheEvict(value="view",key="#pk")
	public int delete(String pk) {
		log.info("执行StudentServiceImpl.delete参数： pk=>" + pk);
		return baseDao.delete("com.rainsoft.mvc.mapper.Student.delete", Integer.parseInt(pk));
	}
    /**
	 * 批量修改
	 * @param object
	 */
	@Override
	public int batchUpdate(List<Student> object) {
		log.info("执行StudentServiceImpl.batchUpdate参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchUpdate("com.rainsoft.mvc.mapper.Student.batchUpdate", object);
	}
	
    /**
	 * 批量插入
	 * @param object
	 */
	@Override
	public int batchInsert(List<Student> object) {
	     log.info("执行StudentServiceImpl.batchInsert参数： List=>" + JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss"));
         return baseDao.batchInsert("com.rainsoft.mvc.mapper.Student.batchInsert", object);
	}
	
    /**
	 * 批量删除
	 */
	@Override
	public int batchDelete(List<Student> pkList) {
		log.info("执行StudentServiceImpl.batchDelete参数： pkList=>" + JSON.toJSONStringWithDateFormat(pkList, "yyyy-MM-dd HH:mm:ss"));
        return baseDao.batchDelete("com.rainsoft.mvc.mapper.Student.batchDelete", pkList);
	}   
	
}
