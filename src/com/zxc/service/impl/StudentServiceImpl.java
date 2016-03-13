package com.zxc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxc.dao.StudentDao;
import com.zxc.domain.Student;
import com.zxc.service.StudentService;

@Transactional
@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public Student login(String name , String password) {
		Student student = (Student) studentDao.findByName(name,password);
		return student;
	}

	@Override
	public Student perinfo(int id) {
		Student student = studentDao.findById(id);
		return student;
	}

	@Override
	public double scoreinfo(int stuId, int couId) {
		double score = studentDao.findScore(stuId, couId);
		return score;
	}

	@Override
	public boolean updateStudentInfo(Student student) {
		studentDao.update(student);
		return true;
	}

}
