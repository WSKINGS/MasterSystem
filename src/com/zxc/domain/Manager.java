package com.zxc.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

public class Manager implements Serializable{

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String password;
	private int gender;
	private Date birthday;
	private String identity;
	private String number;
	private String college;
	private String profession;
	private String duty;
	private String phone;
	private String email;
	private String address;
	private String role;
	private Set<Log> log;
	private Set<Authorization> authorization;
	
	public Manager() {
	}

	public Manager(int id, String name, String password, int gender,
			Date birthday, String identity, String number, String college,
			String profession, String duty, String phone, String email,
			String address, String role, Set<Log> log,
			Set<Authorization> authorization) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.identity = identity;
		this.number = number;
		this.college = college;
		this.profession = profession;
		this.duty = duty;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.role = role;
		this.log = log;
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

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "gender")
	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	@Column(name = "birthday")
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "identity")
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	@Column(name = "number")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(name = "college")
	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	@Column(name = "profession")
	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	@Column(name = "duty")
	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	@Column(name = "phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "log_manager", joinColumns = @JoinColumn(name = "manager_id"),
			inverseJoinColumns = @JoinColumn(name = "log_id"))
	public Set<Log> getLog() {
		return log;
	}

	public void setLog(Set<Log> log) {
		this.log = log;
	}

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "mana_auth", joinColumns = @JoinColumn(name = "manager_id"),
			inverseJoinColumns = @JoinColumn(name = "authorization_id"))
	public Set<Authorization> getAuthorization() {
		return authorization;
	}

	public void setAuthorization(Set<Authorization> authorization) {
		this.authorization = authorization;
	}
	
}
