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
 * Servlet implementation class BankDetails
 */
@WebServlet("/bankdetails")
public class BankDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		boolean res=false;
		
		String email=request.getParameter("email");
		String id=request.getParameter("id");
		
		String name=request.getParameter("name");
		String bankname=request.getParameter("bankname");
		String accountname=request.getParameter("accountnumber");
		
		
		DaoClass obj=new DaoClass();
	    try {
			res=obj.updateBankDetail(name,bankname,accountname,id,email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    if(res)
	    {	
			RequestDispatcher rd=request.getRequestDispatcher("confirm-submission.jsp");
			rd.forward(request, response);
		}
		else
		{
			response.getWriter().print("No Record Found");
		}
	}

}
