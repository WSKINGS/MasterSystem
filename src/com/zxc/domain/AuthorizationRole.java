package com.zxc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role_auth")
public class AuthorizationRole implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int role_id;
	private int auth_id;
	
	public AuthorizationRole() {
	}

	public AuthorizationRole(int id, int role_id, int auth_id) {
		super();
		this.id = id;
		this.role_id = role_id;
		this.auth_id = auth_id;
	}

	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "role_id")
	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	@Column(name = "auth_id")
	public int getAuth_id() {
		return auth_id;
	}

	public void setAuth_id(int auth_id) {
		this.auth_id = auth_id;
	}

}
