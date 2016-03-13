package com.zxc.domain;

// default package

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student")
public class Student implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	// Fields
	@Id
	@Column(name = "id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "password")
	private String password;

	@Column(name = "gender")
	private String gender;

	@Column(name = "birthday")
	private Date birthday;

	@Column(name = "identity")
	private String identity;

	@Column(name = "number")
	private String number;

	@Column(name = "nationality")
	private String nationality;

	@Column(name = "college")
	private String college;

	@Column(name = "profession")
	private String profession;

	@Column(name = "duty")
	private String duty;

	@Column(name = "education")
	private String education;

	@Column(name = "graduate_university")
	private String graduate_university;

	@Column(name = "graduate_time")
	private Date graduate_time;

	@Column(name = "phone")
	private String phone;

	@Column(name = "email")
	private String email;

	@Column(name = "address")
	private String address;

	@Column(name = "evalute")
	private int evalute;

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name = "stu_course", joinColumns = @JoinColumn(name = "student_id"), inverseJoinColumns = @JoinColumn(name = "course_id"))
	private Set<Course> course;

	/** default constructor */
	public Student() {
	}

	public Student(Integer id, String name, String password, String gender,
			Date birthday, String identity, String number, String nationality,
			String college, String profession, String duty, String education,
			String graduate_university, Date graduate_time, String phone,
			String email, String address, int evalute, Set<Course> course) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.identity = identity;
		this.number = number;
		this.nationality = nationality;
		this.college = college;
		this.profession = profession;
		this.duty = duty;
		this.education = education;
		this.graduate_university = graduate_university;
		this.graduate_time = graduate_time;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.evalute = evalute;
		this.course = course;
	}

//	@Override
//	public String toString() {
//		return "Student [id=" + id + ", name=" + name + ", password="
//				+ password + ", gender=" + gender + ", birthday=" + birthday
//				+ ", identity=" + identity + ", number=" + number
//				+ ", nationality=" + nationality + ", college=" + college
//				+ ", profession=" + profession + ", duty=" + duty
//				+ ", education=" + education + ", graduateUniversity="
//				+ graduateUniversity + ", graduateTime=" + graduateTime
//				+ ", phone=" + phone + ", email=" + email + ", address="
//				+ address + ", evalute=" + evalute + ", course=" + course + "]";
//	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getNationality() {
		return this.nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getCollege() {
		return this.college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getProfession() {
		return this.profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getDuty() {
		return this.duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getGraduate_university() {
		return graduate_university;
	}

	public void setGraduate_university(String graduate_university) {
		this.graduate_university = graduate_university;
	}

	public Date getGraduate_time() {
		return graduate_time;
	}

	public void setGraduate_time(Date graduate_time) {
		this.graduate_time = graduate_time;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getEvalute() {
		return evalute;
	}

	public void setEvalute(int evalute) {
		this.evalute = evalute;
	}

	public Set<Course> getCourse() {
		return course;
	}

	public void setCourse(Set<Course> course) {
		this.course = course;
	}

}