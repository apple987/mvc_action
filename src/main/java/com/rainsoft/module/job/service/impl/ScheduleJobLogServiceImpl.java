package com.rainsoft.module.job.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainsoft.core.dao.BaseDao;
import com.rainsoft.module.job.entity.ScheduleJobLogEntity;
import com.rainsoft.module.job.service.ScheduleJobLogService;

@Service("scheduleJobLogService")
public class ScheduleJobLogServiceImpl implements ScheduleJobLogService {

	@Autowired
	private BaseDao baseDao;

	@Override
	public ScheduleJobLogEntity queryObject(Long jobId) {
		return (ScheduleJobLogEntity) baseDao.selectOne("com.rainsoft.mvc.mapper.ScheduleJobLog.queryObject", jobId);

	}

	@Override
	public List<ScheduleJobLogEntity> queryList(Map<String, Object> map) {
		return baseDao.selectList("com.rainsoft.mvc.mapper.ScheduleJobLog.queryList", map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return (int) baseDao.selectOne("com.rainsoft.mvc.mapper.ScheduleJobLog.queryTotal", map);
	}

	@Override
	public void save(ScheduleJobLogEntity log) {
		baseDao.insert("com.rainsoft.mvc.mapper.ScheduleJobLog.save", log);
	}

}
