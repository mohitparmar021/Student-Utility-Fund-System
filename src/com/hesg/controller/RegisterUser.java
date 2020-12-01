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
import com.hesg.pojoClass.RegisterUserPojo;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/registerUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean res=false;
		
		String  email=request.getParameter("username");
		String pass=request.getParameter("password");
		
		RegisterUserPojo user=new RegisterUserPojo();
		user.setUsername(email);
		user.setPassword(pass);
		
		DaoClass obj=new DaoClass();
		try {
			res=obj.registerUser(user);
		} catch (SQLException e) {
			response.getWriter().print("Please try Another Email Id , Already Registered");
		}
		
		if(res)
		{
			RequestDispatcher rd=request.getRequestDispatcher("register-user.jsp");
			request.setAttribute("username", email);
			rd.forward(request, response);
		}
		else
		{
			
		}
		 
	}

}
