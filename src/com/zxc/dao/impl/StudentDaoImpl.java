package com.zxc.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zxc.dao.StudentDao;
import com.zxc.domain.StuCourse;
import com.zxc.domain.Student;

@Repository("studentDao")
@SuppressWarnings("all")
public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {

	private SessionFactory factory;
	
	public SessionFactory getFactory() {
		return factory;
	}
	@Autowired
	public void setFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}

	@Override
	public void save(Student student) {
		this.getHibernateTemplate().save(student);
	}

	@Override
	public void delete(Student student) {
		this.getHibernateTemplate().delete(student);
	}

	@Override
	public boolean update(Student student) {
		this.getHibernateTemplate().update(student);
		return true;
	}

	@Override
	public Student findById(int id) {
		List<Student> list = (List<Student>) this.getHibernateTemplate().find(
				"from Student where id = ?", id);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Student> findAll() {
		List<Student> list = (List<Student>) this.getHibernateTemplate().find(
				"from Student");
		return list;
	}

	@Override
	public Student findByName(String name,String password) {
		List<Student> list = (List<Student>) this.getHibernateTemplate().find("from Student s where s.name = ? and s.password =? ", name,password);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	@Override
	public double findScore(int stuId, int couId) {
		List<StuCourse> list = (List<StuCourse>)this.getHibernateTemplate().find("from StuCourse sc where sc.studentId = ? and sc.courseId = ?", stuId, couId);
		if(list != null && list.size() > 0){
			return list.get(0).getScore();
		}
		return 0;
	}

}
