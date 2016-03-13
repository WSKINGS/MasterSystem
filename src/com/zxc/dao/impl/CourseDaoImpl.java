package com.zxc.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zxc.dao.CourseDao;
import com.zxc.domain.Course;
import com.zxc.domain.Student;

@Repository("courseDao")
@SuppressWarnings("all")
public class CourseDaoImpl extends HibernateDaoSupport implements CourseDao {

	private SessionFactory factory;
	
	public SessionFactory getFactory() {
		return factory;
	}
	@Autowired
	public void setFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	
	@Override
	public Course findById(int id) {
		List<Course> list = (List<Course>) this.getHibernateTemplate().find(
				"from Course where id = ?", id);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public boolean update(Course course) {
		this.getHibernateTemplate().update(course);
		return true;
	}

}
