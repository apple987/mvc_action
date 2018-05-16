package com.rainsoft.util.log;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.SysLog;

/**
 * 记录日志工具类
 */
@Service("logUtil")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true, isolation = Isolation.DEFAULT)
public class LogUtil {

	@Resource(name = "baseDao")
	private BaseDao baseDao;

	/**
	 * 分页查询
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public PageList<SysLog> selectPage(SysLog object) {
		return baseDao.selectPage("com.rainsoft.mvc.mapper.SysLog.select", object);
	}

	/**
	 * 记录日志 在LogUtil中出现出现异常时, 不允许回滚,可以采用如下注解式事务
	 */
	@Transactional(noRollbackFor = Exception.class)
	/*@Transactional(rollbackFor = Exception.class)*/
	public int insert(SysLog object) throws ServletException, IOException {
		 /*String[] arr = new String[2];
		 int res=baseDao.insert("com.rainsoft.mvc.mapper.SysLog.insert", object);
		 System.err.println(arr[2]);
		 return res;*/
		 return baseDao.insert("com.rainsoft.mvc.mapper.SysLog.insert", object);
	}

	/**
	 * 浏览单个
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public SysLog view(Integer pk) {
		return (SysLog) baseDao.view("com.rainsoft.mvc.mapper.SysLog.view", pk);
	}

	/**
	 * 查询单个
	 * 
	 * @param object
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public SysLog query(SysLog object) {
		return (SysLog) baseDao.selectOne("com.rainsoft.mvc.mapper.SysLog.query", object);
	}

	/**
	 * 查询集合
	 * 
	 * @param object
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<SysLog> selectList(SysLog object) {
		return baseDao.selectList("com.rainsoft.mvc.mapper.SysLog.select", object);
	}
	
	/**
	 * 返回数据库名称
	 */
	public String getDataBase() throws SQLException{
		String url=baseDao.getSqlSession().getConnection().getMetaData().getURL();
	    String front=url.substring(0, url.indexOf("?"));
		String db=front.substring(front.lastIndexOf("/")+1);
		return db;
	}

}
