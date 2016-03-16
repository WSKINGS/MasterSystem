package com.zxc.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private Set<Manager> manager;  
	private Set<Authorization> authorization;
	
	public Role() {
	}

	public Role(int id, String name, Set<Manager> manager,
			Set<Authorization> authorization) {
		super();
		this.id = id;
		this.name = name;
		this.manager = manager;
		this.authorization = authorization;
	}

	@Id
	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "role_auth", joinColumns = @JoinColumn(name = "role_id"),
			inverseJoinColumns = @JoinColumn(name = "auth_id"))
	public Set<Authorization> getAuthorization() {
		return authorization;
	}

	public void setAuthorization(Set<Authorization> authorization) {
		this.authorization = authorization;
	}

    @OneToMany(cascade=CascadeType.ALL , mappedBy="role" , fetch=FetchType.EAGER) //关闭延迟加载。 
	public Set<Manager> getManager() {
		return manager;
	}

	public void setManager(Set<Manager> manager) {
		this.manager = manager;
	}
	
}
