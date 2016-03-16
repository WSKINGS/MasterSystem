package com.zxc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxc.dao.ManagerDao;
import com.zxc.domain.Manager;
import com.zxc.service.ManagerService;

@Transactional
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public Manager login(String name, String password) {
		Manager manager = managerDao.findByName(name, password);
		return manager;
	}

	@Override
	public Manager perinfo(int id) {
		Manager manager = managerDao.findById(id);
		return manager;
	}

	@Override
	public boolean updateManagerInfo(Manager manager) {
		managerDao.update(manager);
		return true;
	}

}
