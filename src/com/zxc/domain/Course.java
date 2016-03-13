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
@Table(name = "course")
public class Course implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String teacher;
	private Date begintime;
	private Date endtime;
	private int classhour;
	private int headcount;
	private double score;
	private double excellentrate;
	private String classcode;
	private String type;
	private String state;
	private String classname;
	private Set<Student> student;

	public Course() {
	}

	public Course(int id, String name, String teacher, Date begintime,
			Date endtime, int classhour, int headcount, double score,
			double excellentrate, String classcode, String type, String state,
			String classname, Set<Student> student) {
		super();
		this.id = id;
		this.name = name;
		this.teacher = teacher;
		this.begintime = begintime;
		this.endtime = endtime;
		this.classhour = classhour;
		this.headcount = headcount;
		this.score = score;
		this.excellentrate = excellentrate;
		this.classcode = classcode;
		this.type = type;
		this.state = state;
		this.classname = classname;
		this.student = student;
	}

	// @Override
	// public String toString() {
	// return "Course [id=" + id + ", name=" + name + ", teacher=" + teacher
	// + ", begintime=" + begintime + ", endtime=" + endtime
	// + ", classhour=" + classhour + ", headcount=" + headcount
	// + ", score=" + score + ", excellentrate=" + excellentrate
	// + ", student=" + student + "]";
	// }

	@Column(name = "classname")
	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	@Column(name = "classcode")
	public String getClasscode() {
		return classcode;
	}

	public void setClasscode(String classcode) {
		this.classcode = classcode;
	}

	@Column(name = "type")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "state")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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

	@Column(name = "teacher")
	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	@Column(name = "begintime")
	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	@Column(name = "endtime")
	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	@Column(name = "classhour")
	public int getClasshour() {
		return classhour;
	}

	public void setClasshour(int classhour) {
		this.classhour = classhour;
	}

	@Column(name = "headcount")
	public int getHeadcount() {
		return headcount;
	}

	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}

	@Column(name = "score")
	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Column(name = "excellentrate")
	public double getExcellentrate() {
		return excellentrate;
	}

	public void setExcellentrate(double excellentrate) {
		this.excellentrate = excellentrate;
	}

	@ManyToMany(mappedBy = "course", fetch = FetchType.EAGER)
	public Set<Student> getStudent() {
		return student;
	}

	public void setStudent(Set<Student> student) {
		this.student = student;
	}

}
