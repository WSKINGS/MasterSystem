package com.zxc.service;

import com.zxc.domain.Student;

public interface StudentService {

	public Student login(String name, String password);//学生登录
	
	public Student perinfo(int id);//查看个人信息（个人信息维护）
	
	public double scoreinfo(int stuId, int couId);
	
	public boolean updateStudentInfo(Student student);
}
