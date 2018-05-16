package com.rainsoft.module.job.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.rainsoft.util.MutiSort;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 定时器
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年11月28日 下午12:54:44
 */
@ApiModel(value = "定时任务对象", description = "数据库实体")
public class ScheduleJobEntity extends MutiSort{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 任务调度参数key
	 */
	@ApiModelProperty(value = "任务调度参数key", hidden = true)
	public static final String JOB_PARAM_KEY = "JOB_PARAM_KEY";

	/**
	 * 任务id
	 */
	@ApiModelProperty(value = "任务编号", required = true)
	private Long jobId;

	/**
	 * spring bean名称
	 */
	@ApiModelProperty(value = "任务类名称", required = true)
	private String beanName;

	/**
	 * 方法名
	 */
	@ApiModelProperty(value = "方法名称", required = true)
	private String methodName;

	/**
	 * 参数
	 */
	@ApiModelProperty(value = "执行参数", required = true)
	private String params;

	/**
	 * cron表达式
	 */
	@ApiModelProperty(value = "任务表达式", required = true)
	private String cronExpression;

	/**
	 * 任务状态
	 */
	@ApiModelProperty(value = "任务状态", required = true)
	private Integer status;

	/**
	 * 备注
	 */
	@ApiModelProperty(value = "任务备注", required = true)
	private String remark;

	/**
	 * 创建时间
	 */
	@ApiModelProperty(value = "创建时间", required = false,hidden=true)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date createTime;

	/**
	 * 设置：任务id
	 * 
	 * @param jobId
	 *            任务id
	 */
	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	/**
	 * 获取：任务id
	 * 
	 * @return Long
	 */
	public Long getJobId() {
		return jobId;
	}

	public String getBeanName() {
		return beanName;
	}

	public void setBeanName(String beanName) {
		this.beanName = beanName;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * 设置：任务状态
	 * 
	 * @param status
	 *            任务状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 获取：任务状态
	 * 
	 * @return String
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * 设置：cron表达式
	 * 
	 * @param cronExpression
	 *            cron表达式
	 */
	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	/**
	 * 获取：cron表达式
	 * 
	 * @return String
	 */
	public String getCronExpression() {
		return cronExpression;
	}

	/**
	 * 设置：创建时间
	 * 
	 * @param createTime
	 *            创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取：创建时间
	 * 
	 * @return Date
	 */
	public Date getCreateTime() {
		return createTime;
	}
}
