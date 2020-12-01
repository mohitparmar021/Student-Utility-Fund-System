package com.hesg.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hesg.model.DaoClass;

/**
 * Servlet implementation class TrackApplication
 */
@WebServlet("/trackApplication")
public class TrackApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubtrackApplication
		String email = request.getParameter("trackApplication");
		
        DaoClass obj=new DaoClass();
		
		ResultSet rs=null;
		try {
			 rs=obj.trackApplicationDetail(email);
				if(rs!=null){
					RequestDispatcher rd=request.getRequestDispatcher("track-application.jsp");
					request.setAttribute("rs", rs);
					rd.forward(request, response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher("search-applicant.jsp");
					request.setAttribute("mssg", "Not Record Found");
					rd.forward(request, response);
				}
		} catch (SQLException e) {
			response.getWriter().print("No Record Found");
		}
	}

}
