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
 * Servlet implementation class UpdateAppStatus
 */
@WebServlet("/updateStatus")
public class UpdateAppStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAppStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result=false;
		
		String status=request.getParameter("status");
		String remark=request.getParameter("remark");
		String id=request.getParameter("refid");
		
		DaoClass obj=new DaoClass();
		
		try {
			
			result=obj.updateApplicationStatus(id,status,remark);
			
		} catch (Exception e) {
			System.out.println(result);
			System.out.print(e);
		}
		
		if(result){
			RequestDispatcher rd=request.getRequestDispatcher("pending-application.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.getWriter().print("Problem Occured");
		}
		
	}

}
