package com.zxc.dao;

import com.zxc.domain.Course;

public interface CourseDao {

	public Course findById(int id);
	
	public boolean update(Course course);
}
