package com.hesg.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hesg.model.DaoClass;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/loginuser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String res="";
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		DaoClass obj=new DaoClass();
		try {
		 res=obj.validateUser(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res.equals("Student"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			
			RequestDispatcher rd=request.getRequestDispatcher("user-dashboard.jsp");
			request.setAttribute("username", username);
			rd.forward(request, response);
		}
		else if(res.equals("admin")){
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			
			RequestDispatcher rd=request.getRequestDispatcher("admin-dashboard.jsp");
			request.setAttribute("username", username);
			rd.forward(request, response);
		}
		else
		{
			response.getWriter().print("No Record Found");
		}
	}

}
