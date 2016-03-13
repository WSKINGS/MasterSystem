package com.zxc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "stu_course")
public class StuCourse implements Serializable {

	private static final long serialVersionUID = 1L;

	private int studentId;
	private int courseId;
	private double score;

	public StuCourse() {

	}

	public StuCourse(int studentId, int courseId, double score) {
		super();
		this.studentId = studentId;
		this.courseId = courseId;
		this.score = score;
	}

	@Id
	@Column(name="student_id")
	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	@Id
	@Column(name="course_id")
	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	@Column(name="score")
	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

}
