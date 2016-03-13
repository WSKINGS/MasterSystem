package com.zxc.dao;

import java.util.List;

import com.zxc.domain.Student;

public interface StudentDao {

	public void save(Student student);
	
	public void delete(Student student);
	
	public boolean update(Student student);
	
	public Student findById(int id);
	
	public Student findByName(String name,String password);
	
	public List<Student> findAll();
	
	public double findScore(int stuId, int couId);
}
