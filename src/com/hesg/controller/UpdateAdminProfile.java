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
 * Servlet implementation class UpdateAdminProfile
 */
@WebServlet("/updateAdminProfile")
public class UpdateAdminProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        boolean res=false;      
		
		      String name=request.getParameter("name");
	          String computerCode=request.getParameter("computercode");
	          String email=request.getParameter("email");
	          
	          DaoClass obj=new DaoClass();
	          try {
				res=obj.updateAdminProfile(email, name, computerCode);
				if(res){
					RequestDispatcher rd= request.getRequestDispatcher("profile.jsp");
					rd.forward(request, response);
				}else
				{
					RequestDispatcher rd= request.getRequestDispatcher("profile.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	          
	}

}
