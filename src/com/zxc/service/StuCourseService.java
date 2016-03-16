package com.zxc.service;

import java.util.List;

import com.zxc.domain.StuCourse;

public interface StuCourseService {

	public void addEvaInfo(StuCourse stuCourse);
	
	public void updateEvaInfo(StuCourse stuCourse);
	
	public StuCourse findEvaInfo(int sid, int cid);
	
	public List<StuCourse> displayEvaInfo(int sid);
}
