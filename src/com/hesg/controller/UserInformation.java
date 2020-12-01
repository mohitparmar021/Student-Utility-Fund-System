package com.hesg.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hesg.model.DaoClass;
import com.hesg.pojoClass.UserInfoPojo;

/**
 * Servlet implementation class UserInformation
 */
@WebServlet("/User_info")
public class UserInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean res=false;
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String university=request.getParameter("university");
		String college=request.getParameter("college");
		String course=request.getParameter("course");
		String start=request.getParameter("start");
		String finish=request.getParameter("expect");
		
		UserInfoPojo userobj=new UserInfoPojo();
		userobj.setEmail(email);
		userobj.setName(name);
		userobj.setDob(dob);
		userobj.setGender(gender);
		userobj.setMobile(mobile);
		userobj.setAddress(address);
		userobj.setUniversity(university);
		userobj.setCollege(college);
		userobj.setCourse(course);
		userobj.setStart(start);
		userobj.setFinish(finish);
		
		DaoClass obj=new DaoClass();
		try {
		  res=obj.setUserInfo(userobj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res)
		{
			RequestDispatcher rd=request.getRequestDispatcher("index.html");
			rd.forward(request, response);
		}
		else
		{
			response.getWriter().print("Error");
		}
		
		
	}

}
