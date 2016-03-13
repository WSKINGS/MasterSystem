package com.zxc.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "log")
public class Log implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id ;
	private String operation;
	private String managername;
	private String college;
	private Date time;
	private String ip;
	private String detail;
	private Set<Manager> manager;
	
	public Log(){}

	public Log(int id, String operation, String managername, String college,
			Date time, String ip, String detail, Set<Manager> manager) {
		super();
		this.id = id;
		this.operation = operation;
		this.managername = managername;
		this.college = college;
		this.time = time;
		this.ip = ip;
		this.detail = detail;
		this.manager = manager;
	}

	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "operation")
	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Column(name = "managername")
	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	@Column(name = "college")
	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	@Column(name = "time")
	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "ip")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Column(name = "detail")
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@ManyToMany(mappedBy = "log" , fetch = FetchType.EAGER)
	public Set<Manager> getManager() {
		return manager;
	}

	public void setManager(Set<Manager> manager) {
		this.manager = manager;
	}

}
