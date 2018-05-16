package com.rainsoft.mvc.service;

import java.util.List;
import java.util.Map;

import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.Staff;
/**
 * TODO 本代码由代码生成工具生成
 *
 * @author 付为地
 * @date 2017-04-17 10:00:04
 */

public interface StaffService {

	/**
	 * 分页查询
	 * @param pageInfo
	 * @param params
	 * @return
	 */
	public PageList<Staff> selectPage(Map<String, Object> params);
	
	/**
	 * 新增
	 * @param object
	 * @return
	 */
	public int insert(Staff object) ;
	
	/**
	 * 修改
	 * @param object
	 * @return
	 */
	public int update(Staff object)  ;
	
	/**
	 * 查看
	 * @param pk
	 * @return
	 */
	public Staff view(String pk) ;
	
	/**
	 * 批量删除
	 * @param pk_array
	 * @return
	 */
	public int delete(String[] pk_array);
	
	/**
	 * 删除
	 * @param pk
	 * @return
	 */
	public int delete(String pk);

    /**
	 * 不分页查询
	 */
	public List<?> selectList(Map<String, Object> mp);
	
}
