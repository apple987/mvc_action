package com.rainsoft.mvc.model;

import java.util.Date;

import com.rainsoft.util.MutiSort;

/**
 * 所有的实体类必须继承MutiSort,
 *   MutiSort类里面有排序,分页信息
 * 针对页面采用application/json格式时才可以使用
 */
public class DataInterrupt extends MutiSort {
	
	private static final long serialVersionUID = 2081900166113285237L;
	
	private Date startTime;
	private Date endTime;
	private Date importTime;
	private String breakSource;
	private String status;
	private String sname;
	
	public DataInterrupt() {
		super();
	}
	public DataInterrupt(Date startTime, Date endTime, Date importTime, String breakSource, String status) {
		super();
		this.startTime = startTime;
		this.endTime = endTime;
		this.importTime = importTime;
		this.breakSource = breakSource;
		this.status = status;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getImportTime() {
		return importTime;
	}
	public void setImportTime(Date importTime) {
		this.importTime = importTime;
	}
	public String getBreakSource() {
		return breakSource;
	}
	public void setBreakSource(String breakSource) {
		this.breakSource = breakSource;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
}
