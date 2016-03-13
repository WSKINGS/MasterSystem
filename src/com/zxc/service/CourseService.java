package com.zxc.service;

import com.zxc.domain.Course;

public interface CourseService {

	public Course findCourseById(int id);
	
	public boolean updateCourse(Course course);
}
