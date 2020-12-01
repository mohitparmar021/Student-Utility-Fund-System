
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
 * Servlet implementation class UpdateDetailRebate
 */
@WebServlet("/updatedetail")
public class UpdateDetailRebate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDetailRebate() {
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
		String address=request.getParameter("address");
		String mobile=request.getParameter("mobile");
		String university=request.getParameter("university");
		String college=request.getParameter("college");
		String course=request.getParameter("course");
		
		UserInfoPojo userobj=new UserInfoPojo();
		userobj.setEmail(email);
		userobj.setName(name);
		userobj.setAddress(address);
		userobj.setMobile(mobile);
		userobj.setUniversity(university);
		userobj.setCollege(college);
		userobj.setCourse(course);

		DaoClass obj=new DaoClass();
		try {
		  res=obj.updateUserDetailRebate(userobj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res)
		{
			RequestDispatcher rd=request.getRequestDispatcher("add-expense.jsp");
			request.setAttribute("email", email);
			rd.forward(request, response);
		}
		else
		{
			response.getWriter().print("No Record Found");
		}
		
	}

}
