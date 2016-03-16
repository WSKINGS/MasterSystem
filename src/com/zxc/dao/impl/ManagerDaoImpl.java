package com.zxc.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zxc.dao.ManagerDao;
import com.zxc.domain.Manager;

@Repository("managerDao")
@SuppressWarnings("all")
public class ManagerDaoImpl extends HibernateDaoSupport implements ManagerDao {

	private SessionFactory factory;
	
	public SessionFactory getFactory() {
		return factory;
	}
	
	@Autowired
	public void setFactory(SessionFactory factory) {
		super.setSessionFactory(factory);
	}
	
	@Override
	public void save(Manager manager) {
		this.getHibernateTemplate().save(manager);
	}

	@Override
	public void update(Manager manager) {
		this.getHibernateTemplate().update(manager);
	}

	@Override
	public void delete(Manager manager) {
		this.getHibernateTemplate().delete(manager);
	}

	@Override
	public Manager findById(int id) {
		List<Manager> list = (List<Manager>) this.getHibernateTemplate().find(
				"from Manager where id = ?", id);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public Manager findByName(String name, String password) {
		List<Manager> list = (List<Manager>) this.getHibernateTemplate().find(
				"from Manager m where m.name = ? and m.password =? ", name,password);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Manager> findAll() {
		List<Manager> list = (List<Manager>) this.getHibernateTemplate().find(
				"from Manager");
		return list;
	}

}
