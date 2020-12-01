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

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean res=false;
		
		String newPassword=request.getParameter("npassword");
		   String email=request.getParameter("username");
		   
		   DaoClass obj=new DaoClass();
		       try {
				res= obj.setNewPassword(email,newPassword);
				if(res){
					RequestDispatcher rd=request.getRequestDispatcher("admin-dashboard.jsp");
					rd.forward(request, response);
				}
				else
				{
				    response.getWriter().print("Password Not Changed");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
