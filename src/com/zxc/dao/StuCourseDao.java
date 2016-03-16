package com.zxc.dao;

import java.util.List;

import com.zxc.domain.StuCourse;

public interface StuCourseDao {

	public void add(StuCourse stucourse);
	
	public void update(StuCourse stucourse);
	
	public StuCourse findById(int sid, int cid);
	
	public List<StuCourse> findByStu(int sid);
}
