package com.rainsoft.mvc.service;

import java.util.List;

import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Platform;
/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-07-11 11:01:20
 */

public interface PlatformService {

	/**
	 * 分页查询
	 * @param entity
	 * @return
	 */
	public PageList<Platform> selectPage(Platform entity);
	
	/**
	 * 新增
	 * @param object
	 * @return
	 */
	public int insert(Platform object) ;
	
	/**
	 * 修改
	 * @param object
	 * @return
	 */
	public int update(Platform object)  ;
	
	/**
	 * 查看
	 * @param pk
	 * @return
	 */
	public Platform view(Integer pk) ;
	
	/**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public Platform query(Platform object) ;
	
	/**
	 * 查询集合
	 * @param object
	 * @return
	 */
	public List<Platform> selectList(Platform object) ;
	
	/**
	 * 删除
	 * @param pk
	 * @return
	 */
	public int delete(String pk);
	
	/**
	 * 批量修改
	 * @param object
	 */
	public int batchUpdate(List<Platform> arr);
	
	/**
	 * 批量插入
	 * @param object
	 */
	public int batchInsert(List<Platform> arr);
	
	/**
	 * 批量删除
	 */
	public int batchDelete(List<Platform> pkList);
}
