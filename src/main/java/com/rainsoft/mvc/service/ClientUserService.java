package com.rainsoft.mvc.service;

import java.util.List;

import com.rainsoft.mvc.model.ClientUser;
import com.rainsoft.core.page.PageList;
/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-12-28 09:14:09
 */

public interface ClientUserService {

	/**
	 * 分页查询
	 * @param entity
	 * @return
	 */
	public PageList<ClientUser> selectPage(ClientUser entity);
	
	/**
	 * 新增
	 * @param object
	 * @return
	 */
	public int insert(ClientUser object) ;
	
	/**
	 * 修改
	 * @param object
	 * @return
	 */
	public int update(ClientUser object)  ;
	
	/**
	 * 查看
	 * @param pk
	 * @return
	 */
	public ClientUser view(String pk) ;
	
	/**
	 * 查询单个
	 * @param object
	 * @return
	 */
	public ClientUser query(ClientUser object) ;
	
	/**
	 * 查询集合
	 * @param object
	 * @return
	 */
	public List<ClientUser> selectList(ClientUser object) ;
	
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
	public int batchUpdate(List<ClientUser> arr);
	
	/**
	 * 批量插入
	 * @param object
	 */
	public int batchInsert(List<ClientUser> arr);
	
	/**
	 * 批量删除
	 */
	public int batchDelete(List<ClientUser> pkList);
}
