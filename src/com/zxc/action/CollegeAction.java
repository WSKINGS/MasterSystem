package com.zxc.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zxc.domain.Manager;
import com.zxc.domain.Student;
import com.zxc.service.ManagerService;

@Controller
@SuppressWarnings("all")
public class CollegeAction extends ActionSupport implements
ModelDriven<Manager> {

	private Manager manager = new Manager();
	
	@Autowired
	private ManagerService managerService;
	
	@Override
	public Manager getModel() {
		return this.manager;
	}

	
}
