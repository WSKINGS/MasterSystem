package com.zxc.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zxc.dao.StuCourseDao;
import com.zxc.domain.StuCourse;

@Repository("stuCourseDao")
@SuppressWarnings("all")
public class StuCourseDaoImpl extends HibernateDaoSupport implements StuCourseDao {

	private SessionFactory factory;
	
	public SessionFactory getFactory() {
		return factory;
	}
	@Autowired
	public void setFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	@Override
	public void add(StuCourse stucourse) {
		this.getHibernateTemplate().save(stucourse);
	}
	
	@Override
	public void update(StuCourse stucourse) {
		this.getHibernateTemplate().update(stucourse);
	}
	
	@Override
	public StuCourse findById(int sid, int cid) {
		List<StuCourse> list = (List<StuCourse>) this.getHibernateTemplate().find(
				"from StuCourse s where s.studentId = ? and s.courseId = ?", sid, cid);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	@Override
	public List<StuCourse> findByStu(int sid) {
		System.out.println(this.getHibernateTemplate());
		List<StuCourse> list = (List<StuCourse>) this.getHibernateTemplate().find(
				"from StuCourse s where s.studentId = ? ", sid);
		return list;
	}

}
