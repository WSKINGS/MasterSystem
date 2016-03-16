package com.zxc.action;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.zxc.domain.Course;
import com.zxc.domain.Manager;
import com.zxc.domain.StuCourse;
import com.zxc.domain.Student;
import com.zxc.service.CourseService;
import com.zxc.service.ManagerService;
import com.zxc.service.StuCourseService;
import com.zxc.service.StudentService;

@Controller
@SuppressWarnings("all")
public class StudentAction extends ActionSupport implements
		ModelDriven<Student> {

	private Manager manager = new Manager();
	private Student student = new Student();

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ManagerService managerService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private StuCourseService stuCourseService;

	@Override
	public Student getModel() {
		return this.student;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String login() throws UnsupportedEncodingException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		ActionContext context = ActionContext.getContext();
		Map params = context.getParameters();
		Object nameobj = params.get("name");
		Object passwordobj = params.get("password");
		Object checkobj = params.get("checkbox");
		int flag = 0;

		if (nameobj != null && passwordobj != null) {
			String[] name = (String[]) nameobj;
			String[] password = (String[]) passwordobj;
			
			System.out.println(name[0]);
			System.out.println(password[0]);

			///////////before Cookie///////////
			if(checkobj == null){
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					try{
						for(int i=0;i<cookies.length;i++) {
							Cookie cookie = new Cookie(cookies[i].getName(), null);
							cookie.setMaxAge(0);
							cookie.setPath("/");//根据你创建cookie的路径进行填写
							response.addCookie(cookie);
						}
					}
					catch(Exception ex) {
						System.out.println("删除Cookies发生异常！");
					}
				}
			}
			
			
			///////////Cookie///////////
			if(checkobj != null){
				String[] c = (String[]) checkobj;
				String check = c[0];
				if(check.equals("on")){
					String pwd = password[0];
					String username = java.net.URLEncoder.encode(name[0],"utf-8");
					
					String host = request.getServerName();
					Cookie cookie = new Cookie("SESSION_LOGIN_USERNAME", username  ); // 保存用户名到Cookie
					cookie.setPath("/");
					cookie.setDomain(host);
					cookie.setMaxAge(99999999);
					response.addCookie(cookie);

					cookie = new Cookie("SESSION_LOGIN_PASSWORD", pwd);
					cookie.setPath("/");
					cookie.setDomain(host);
					cookie.setMaxAge(99999999);
					response.addCookie(cookie);
				}
			}
			////////////////////////////

			if (studentService.login(name[0], password[0]) != null) {
				student = studentService.login(name[0], password[0]);
					// HttpServletRequest request =
					// ServletActionContext.getRequest();
					// request.setAttribute("studentName", student.getName());
					// request.setAttribute("studentId", student.getId());

					ActionContext.getContext().getSession()
							.put("studentName", student.getName());
					ActionContext.getContext().getSession()
							.put("studentId", student.getId());
					ActionContext.getContext().getSession()
							.put("student", student);

					List<StuCourse> list = stuCourseService
							.displayEvaInfo(student.getId());

					for (int j = 0; j < list.size(); j++) {
						if (list.get(j).getState().equals("已评价")
								&& j != list.size() - 1) {
						} else if (list.get(j).getState().equals("已评价")
								&& j == list.size() - 1) {
							flag = 1;
						} else {
							break;
						}
					}
					ActionContext.getContext().getSession()
							.put("allEvaluate", flag);
					// ////////测试//////////
					// Set<Course> set = student.getCourse();
					// Iterator<Course> it = set.iterator();
					// while(it.hasNext()){
					// Course course = it.next();
					// System.out.println(course.getName());
					// }
					return "index";
			} else if(managerService.login(name[0], password[0]) != null) {
				
				manager = managerService.login(name[0], password[0]);
				
				ActionContext.getContext().getSession().put("college", manager);
				
				return "index2";
			}
		}
		return ERROR;
	}

	public String perinfo() {
		return "personinfo";
	}

	public String save() throws ParseException {
		HttpServletRequest request = ServletActionContext.getRequest();

		Student student = (Student) ActionContext.getContext().getSession()
				.get("student");

		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sim.parse(request.getParameter("birthday"));
		Date date2 = sim.parse(request.getParameter("graduateyear"));

		int id = (Integer) ActionContext.getContext().getSession()
				.get("studentId");

		student.setId(id);
		student.setName(request.getParameter("name"));
		student.setGender(request.getParameter("gender"));

		System.out.println(request.getParameter("gender"));

		student.setBirthday(date);
		student.setIdentity(request.getParameter("identity"));
		student.setNumber(request.getParameter("number"));
		student.setNationality(request.getParameter("nation"));
		student.setCollege(request.getParameter("college"));
		student.setProfession(request.getParameter("profession"));

		System.out.println(request.getParameter("profession"));

		student.setDuty(request.getParameter("duty"));
		student.setEducation(request.getParameter("education"));

		System.out.println(request.getParameter("education"));

		student.setGraduate_time(date2);
		student.setGraduate_university(request
				.getParameter("graduateuniversity"));
		student.setPhone(request.getParameter("phone"));
		student.setEmail(request.getParameter("email"));
		student.setAddress(request.getParameter("Addr"));

		// 更新方法
		boolean flag = studentService.updateStudentInfo(student);

		ActionContext.getContext().getSession().put("student", student);

		if (flag)
			return "savesuccess";
		else
			return ERROR;
	}

	public String back() {
		return "savesuccess";
	}

	public String scoreinfo() {
		Student student = (Student) ActionContext.getContext().getSession()
				.get("student");
		int sid = student.getId();
		List<StuCourse> list = stuCourseService.displayEvaInfo(sid);

		ActionContext.getContext().getSession().put("courseScore", list);
		return "score";
	}

	public String stuevaluate() {
		Student student = (Student) ActionContext.getContext().getSession()
				.get("student");
		int sid = student.getId();
		List<StuCourse> list = stuCourseService.displayEvaInfo(sid);
		List<Course> courses = new ArrayList<Course>();

		for (StuCourse stuCourse : list) {
			Course course = courseService.findCourseById(stuCourse
					.getCourseId());
			courses.add(course);
		}

		ActionContext.getContext().getSession().put("courses", courses);
		ActionContext.getContext().getSession().put("courseList", list);
		return "stuevaluate";
	}

	public String evaluate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr = request.getParameter("courseId");
		request.setAttribute("courseId", idstr);
		return "evaluate";
	}

	public String evasave() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String eva1 = request.getParameter("ques1");
		String eva2 = request.getParameter("ques2");
		String eva3 = request.getParameter("ques3");
		String suggestion = request.getParameter("suggestion");
		int e1 = Integer.parseInt(eva1);
		int e2 = Integer.parseInt(eva2);
		int e3 = Integer.parseInt(eva3);
		double score = e1 + e2 + e3;

		String idstr = request.getParameter("courseid");
		int id = Integer.parseInt(idstr);
		// Course course = courseService.findCourseById(id);

		int cid = id;
		int sid = (Integer) ActionContext.getContext().getSession()
				.get("studentId");

		StuCourse stuCourse = stuCourseService.findEvaInfo(sid, cid);

		if (stuCourse.getState().equals("未评价")) {
			stuCourse.setScore(score);
			stuCourse.setSuggestion(suggestion);
			stuCourse.setState("已评价");

			stuCourseService.updateEvaInfo(stuCourse);
		} else {
			stuCourse.setScore(score);
			stuCourse.setSuggestion(suggestion);

			stuCourseService.updateEvaInfo(stuCourse);
		}
		List<StuCourse> list = (List<StuCourse>) ActionContext.getContext()
				.getSession().get("courseList");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCourseId() == stuCourse.getCourseId()) {
				list.remove(i);
				list.add(i, stuCourse);
			}
		}

		ActionContext.getContext().getSession().put("courseList", list);
		// course.setScore(score);
		// course.setState("已评价");

		// courseService.updateCourse(course);

		// Student student = (Student)
		// ActionContext.getContext().getSession().get("student");
		// Set<Course> courseSet = new HashSet<Course>();
		// Set<Course> courses = student.getCourse();
		// Iterator<Course> it = courses.iterator();
		// while (it.hasNext()) {
		// Course ctemp = it.next();
		// if(ctemp.getId() == id)
		// ctemp = course;
		// courseSet.add(ctemp);
		// }
		// student.setCourse(courseSet);
		// ActionContext.getContext().getSession().put("student", student);
		return "evasave";
	}

	public String submitback() {
		return "evasave";
	}

	public String exit() {
		ActionContext.getContext().getSession().clear();
		return "exit";
	}
}
