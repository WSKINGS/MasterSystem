package com.zxc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "log_manager")
public class LogManager implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int managerId;
	private int logId;
	
	public LogManager() {
	}

	public LogManager(int managerId, int logId) {
		super();
		this.managerId = managerId;
		this.logId = logId;
	}
	
	@Id
	@Column(name = "manager_id")
	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	@Id
	@Column(name = "log_id")
	public int getLogId() {
		return logId;
	}

	public void setLogId(int logId) {
		this.logId = logId;
	}

	
}
