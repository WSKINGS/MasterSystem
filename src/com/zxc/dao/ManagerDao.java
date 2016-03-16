package com.zxc.dao;

import java.util.List;

import com.zxc.domain.Manager;

public interface ManagerDao {

	public void save(Manager manager);
	
	public void update(Manager manager);
	
	public void delete(Manager manager);
	
	public Manager findById(int id);
	
	public Manager findByName(String name,String password);
	
	public List<Manager> findAll();
	
}
