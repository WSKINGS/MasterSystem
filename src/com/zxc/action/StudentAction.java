package com.zxc.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zxc.domain.Course;
import com.zxc.domain.Student;
import com.zxc.service.CourseService;
import com.zxc.service.StudentService;

@Controller
@SuppressWarnings("all")
public class StudentAction extends ActionSupport implements ModelDriven<Student>{

	private Student student = new Student();
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseService;
	
	@Override
	public Student getModel() {
		return this.student;
	}

	public String login(){
		ActionContext context = ActionContext.getContext();
		Map params = context.getParameters();
		Object nameobj = params.get("name");
		Object passwordobj = params.get("password");
		
		if(nameobj!=null && passwordobj!=null){
			 String[] name = (String[])nameobj; 
			 String[] password = (String[])passwordobj;
			 System.out.println(name[0]);
			 System.out.println(password[0]);
			 if(studentService.login(name[0],password[0])!=null)
			 {
				 student = studentService.login(name[0],password[0]);
				 if(student.getId() == 1){
//					 HttpServletRequest request = ServletActionContext.getRequest();
//					 request.setAttribute("studentName", student.getName());
//					 request.setAttribute("studentId", student.getId());
					 
					 ActionContext.getContext().getSession().put("studentName", student.getName());
					 ActionContext.getContext().getSession().put("studentId", student.getId());
					 ActionContext.getContext().getSession().put("student", student);
					 //////////测试//////////
//					 Set<Course> set = student.getCourse();
//					 Iterator<Course> it = set.iterator();
//					 while(it.hasNext()){
//						 Course course = it.next();
//						 System.out.println(course.getName());
//					 }
					 return "index";
				}
			 }else{
				 return ERROR;
			 }
		}
		return ERROR;
	}
	
	public String perinfo(){
		return "personinfo";
	}
	
	public String save() throws ParseException{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		Student student =  (Student) ActionContext.getContext().getSession().get("student");
		
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sim.parse(request.getParameter("birthday"));
		Date date2 = sim.parse(request.getParameter("graduateyear"));
		
		int id = (Integer) ActionContext.getContext().getSession().get("studentId");
		
		student.setId(id);
		student.setName(request.getParameter("name"));
		student.setGender(request.getParameter("gender"));
		student.setBirthday(date);
		student.setIdentity(request.getParameter("identity"));
		student.setNumber(request.getParameter("number"));
		student.setNationality(request.getParameter("nation"));
		student.setCollege(request.getParameter("college"));
		student.setProfession(request.getParameter("profession"));
		student.setDuty(request.getParameter("duty"));
		student.setEducation(request.getParameter("education"));
		student.setGraduate_time(date2);
		student.setGraduate_university(request.getParameter("graduateuniversity"));
		student.setPhone(request.getParameter("phone"));
		student.setEmail(request.getParameter("email"));
		student.setAddress(request.getParameter("Addr"));
		
		//更新方法
		boolean flag = studentService.updateStudentInfo(student);
		
		ActionContext.getContext().getSession().put("student", student);
		
		if(flag)
			return "savesuccess";
		else
			return ERROR;
	}
	
	public String back(){
		return "savesuccess";
	}
	
	public String scoreinfo()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr = request.getParameter("stuid");
		int id = Integer.parseInt(idstr);
		List<Double> list = new ArrayList<Double>(); 
		
		Student student = studentService.perinfo(id);
		int stuId = student.getId();
		Set<Course> set = student.getCourse();
		Iterator<Course> it = set.iterator();  
		while (it.hasNext()) {  
			Course course = it.next();
			int courseId = course.getId();
			list.add(studentService.scoreinfo(stuId, courseId));
		} 
		
		if(student.getEvalute() == 1){//如果评价成功则可以查看成绩
			request.setAttribute("scores", list);
			request.setAttribute("courses", set);
			return "scoreinfo";
		}
		return ERROR;
	}
	
	public String stuevaluate(){
		return "stuevaluate";
	}
	
	public String evaluate(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr = request.getParameter("courseId");
		request.setAttribute("courseId", idstr);
		return "evaluate";
	}
	
	public String evasave(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String eva1 = request.getParameter("ques1"); 
		String eva2 = request.getParameter("ques2"); 
		String eva3 = request.getParameter("ques3");
		int e1 = Integer.parseInt(eva1);
		int e2 = Integer.parseInt(eva2);
		int e3 = Integer.parseInt(eva3);
		double score = e1 + e2 + e3;
		
		String idstr = request.getParameter("courseid");
		int id = Integer.parseInt(idstr);
		Course course = courseService.findCourseById(id);
		
		course.setScore(score);
		course.setState("已评价");
		
		courseService.updateCourse(course);
		
		Student student = (Student) ActionContext.getContext().getSession().get("student");
		Set<Course> courseSet = new HashSet<Course>();
		Set<Course> courses = student.getCourse();
		Iterator<Course> it = courses.iterator();  
		while (it.hasNext()) {  
		  Course ctemp = it.next();
		  if(ctemp.getId() == id)
			  ctemp = course;
		  courseSet.add(ctemp);
		}
		student.setCourse(courseSet);
		ActionContext.getContext().getSession().put("student", student);
		return "evasave";
	}
	
	public String exit(){
		ActionContext.getContext().getSession().clear();
		return "exit";
	}
}
