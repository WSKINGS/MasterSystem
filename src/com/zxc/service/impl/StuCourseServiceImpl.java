package com.zxc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxc.dao.StuCourseDao;
import com.zxc.domain.StuCourse;
import com.zxc.service.StuCourseService;

@Transactional
@Service("stuCourseService")
public class StuCourseServiceImpl implements StuCourseService{
	
	@Autowired
	private StuCourseDao stuCourseDao;
	        
	@Override
	public void addEvaInfo(StuCourse stuCourse) {
		stuCourseDao.add(stuCourse);
	}

	@Override
	public StuCourse findEvaInfo(int sid, int cid) {
		StuCourse stuCourse = stuCourseDao.findById(sid, cid);
		return stuCourse;
	}

	@Override
	public void updateEvaInfo(StuCourse stuCourse) {
		stuCourseDao.update(stuCourse);
	}

	@Override
	public List<StuCourse> displayEvaInfo(int sid) {
		List<StuCourse> list = stuCourseDao.findByStu(sid);
		return list;
	}
	
}
