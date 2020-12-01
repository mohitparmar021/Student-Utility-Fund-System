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
 * Servlet implementation class SearchApplicant
 */
@WebServlet("/searchApplicant")
public class SearchApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchApplicant() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("searchapplicant");
		
		DaoClass obj=new DaoClass();
		
		ResultSet rs=null;
		try {
			 rs=obj.displayUserDetail(email);
				
			 if(rs!=null){
					RequestDispatcher rd=request.getRequestDispatcher("search-applicant-detail.jsp");
					request.setAttribute("rs", rs);
					rd.forward(request, response);
				}
			 else
			 {
				 response.getWriter().print("No Record Found");
			 }
		} catch (SQLException e) {
			response.getWriter().print("No Record Found");
		}
		
		
	}

}
