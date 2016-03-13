package com.zxc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mana_auth")
public class AuthorizationManager implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int managerId;
	private int authorizationId;
	
	public AuthorizationManager() {
	}

	public AuthorizationManager(int managerId, int authorizationId) {
		super();
		this.managerId = managerId;
		this.authorizationId = authorizationId;
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
	@Column(name = "authorization_id")
	public int getAuthorizationId() {
		return authorizationId;
	}

	public void setAuthorizationId(int authorizationId) {
		this.authorizationId = authorizationId;
	}

}
