package com.zxc.domain;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "authorization")
public class Authorization implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	private String authorizations;
	private Set<Manager> manager;
	
	public Authorization() {
	}

	public Authorization(int id, String authorizations, Set<Manager> manager) {
		super();
		this.id = id;
		this.authorizations = authorizations;
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

	@Column(name = "authorizations")
	public String getAuthorizations() {
		return authorizations;
	}

	public void setAuthorizations(String authorizations) {
		this.authorizations = authorizations;
	}
	@ManyToMany(mappedBy = "authorization" , fetch = FetchType.EAGER)
	public Set<Manager> getManager() {
		return manager;
	}

	public void setManager(Set<Manager> manager) {
		this.manager = manager;
	}

	
}
