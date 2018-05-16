package com.rainsoft.module.job.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rainsoft.constant.Constants;
import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.core.page.PageList;
import com.rainsoft.module.job.entity.ScheduleJobEntity;
import com.rainsoft.module.job.service.ScheduleJobService;
import com.rainsoft.module.job.utils.ScheduleUtils;

@Service("scheduleJobService")
public class ScheduleJobServiceImpl implements ScheduleJobService {
	@Autowired
    private Scheduler scheduler;
	@Autowired
	private BaseDao baseDao;
	
	/**
	 * 项目启动时，初始化定时器
	 */
	@PostConstruct
	public void init(){
		List<ScheduleJobEntity> scheduleJobList = baseDao.selectList("com.rainsoft.mvc.mapper.ScheduleJob.queryList",new HashMap<String, Object>());
		
		for(ScheduleJobEntity scheduleJob : scheduleJobList){
			CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, scheduleJob.getJobId());
            //如果不存在，则创建
            if(cronTrigger == null) {
                ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
            }else {
                ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
            }
		}
	}
	
	@Override
	public ScheduleJobEntity queryObject(Long jobId) {
		return (ScheduleJobEntity) baseDao.selectOne("com.rainsoft.mvc.mapper.ScheduleJob.queryObject", jobId);
	}

	@Override
	public List<ScheduleJobEntity> queryList(Map<String, Object> map) {
		return baseDao.selectList("com.rainsoft.mvc.mapper.ScheduleJob.queryList",map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return (int) baseDao.selectOne("com.rainsoft.mvc.mapper.ScheduleJob.queryTotal", map);
	}

	@Override
	@Transactional
	public void save(ScheduleJobEntity scheduleJob) {
		scheduleJob.setCreateTime(new Date());
		scheduleJob.setStatus(Constants.ScheduleStatus.NORMAL.getValue());
		baseDao.insert("com.rainsoft.mvc.mapper.ScheduleJob.save", scheduleJob);
        ScheduleUtils.createScheduleJob(scheduler, scheduleJob);
    }
	
	@Override
	@Transactional
	public void update(ScheduleJobEntity scheduleJob) {
        ScheduleUtils.updateScheduleJob(scheduler, scheduleJob);
        baseDao.update("com.rainsoft.mvc.mapper.ScheduleJob.update", scheduleJob);
    }

	@Override
	@Transactional
    public void deleteBatch(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		ScheduleUtils.deleteScheduleJob(scheduler, jobId);
    	}
    	//删除数据
    	baseDao.delete("com.rainsoft.mvc.mapper.ScheduleJob.deleteBatch", jobIds);
	}

	@Override
    public int updateBatch(Long[] jobIds, int status){
    	Map<String, Object> map = new HashMap<>();
    	map.put("list", jobIds);
    	map.put("status", status);
    	return baseDao.update("com.rainsoft.mvc.mapper.ScheduleJob.updateBatch", map);
    }
    
	@Override
	@Transactional
    public void run(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		ScheduleUtils.run(scheduler, queryObject(jobId));
    	}
    }

	@Override
	@Transactional
    public void pause(Long[] jobIds) {
        for(Long jobId : jobIds){
    		ScheduleUtils.pauseJob(scheduler, jobId);
    	}
        
    	updateBatch(jobIds, Constants.ScheduleStatus.PAUSE.getValue());
    }

	@Override
	@Transactional
    public void resume(Long[] jobIds) {
    	for(Long jobId : jobIds){
    		ScheduleUtils.resumeJob(scheduler, jobId);
    	}
    	updateBatch(jobIds, Constants.ScheduleStatus.NORMAL.getValue());
    }

	@Override
	public PageList<ScheduleJobEntity> selectPage(ScheduleJobEntity entity) {
		return baseDao.selectPage("com.rainsoft.mvc.mapper.ScheduleJob.select", entity);
	}
    
}
