package com.zxc.service;

import com.zxc.domain.Manager;

public interface ManagerService {

	public Manager login(String name, String password);//管理员登录
	
	public Manager perinfo(int id);//查看个人信息（个人信息维护）
	
	public boolean updateManagerInfo(Manager manager);
}
