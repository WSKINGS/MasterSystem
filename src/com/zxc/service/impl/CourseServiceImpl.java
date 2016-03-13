package com.zxc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxc.dao.CourseDao;
import com.zxc.domain.Course;
import com.zxc.service.CourseService;

@Transactional
@Service("courseService")
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	
	@Override
	public Course findCourseById(int id) {
		Course course = courseDao.findById(id);
		return course;
	}

	@Override
	public boolean updateCourse(Course course) {
		courseDao.update(course);
		return true;
	}

}
