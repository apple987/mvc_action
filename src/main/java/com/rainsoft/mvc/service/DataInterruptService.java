package com.rainsoft.mvc.service;

import java.util.List;
import java.util.Map;

import com.rainsoft.core.page.PageList;
import com.rainsoft.mvc.model.DataInterrupt;

public interface DataInterruptService {

	public int delete(String[] pk_array);

	public int delete(Object pkid);

	public DataInterrupt insert(DataInterrupt object);

	public PageList<DataInterrupt> selectPage(Map<String, Object> params);
	
	public PageList<DataInterrupt> selectPage(DataInterrupt params);

	public DataInterrupt update(DataInterrupt object);

	public DataInterrupt view(String pk);

	public List<?> queryData(Map<?, ?> mp);
	
	public List<?> selectList(Map<?, ?> mp);

	DataInterrupt queryBean(DataInterrupt object);
	
	public Map<String,Object> testCase(Map<?, ?> mp);

}
