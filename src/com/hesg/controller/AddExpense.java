package com.hesg.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.hesg.model.MyConnection;

/**
 * Servlet implementation class AddExpense
 */
@WebServlet("/addexpense")

@MultipartConfig(maxFileSize = 16177215)

public class AddExpense extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddExpense() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	String email=request.getParameter("email");
	String transactionid=request.getParameter("transaction_id");
	String retailername=request.getParameter("retailername");
	String date=request.getParameter("date");
	String category=request.getParameter("category");
	String projectDes=request.getParameter("projectDescription");
	String expense=request.getParameter("cost");		
			
	float cost=Float.valueOf(expense).floatValue();
	
	InputStream inputStream=null;
	
	Part filePart=request.getPart("uploadreceipt");
	
	if(filePart!=null)
	{
		inputStream=filePart.getInputStream();
	}
	
	
	Connection con=null;
	con=MyConnection.getMyConnection();
	PreparedStatement stmt=null;
	String query="insert into expense_info(email,transaction_id,retailername,date,category,transaction_cost,receipt_photo,projectdescription) values(?,?,?,?,?,?,?,?)";
	
    try 
    {
		stmt=con.prepareStatement(query);
		stmt.setString(1, email);
		stmt.setString(2,transactionid);
		stmt.setString(3, retailername);
		stmt.setString(4, date);
		stmt.setString(5, category);
		stmt.setFloat(6, cost);
		stmt.setString(8, projectDes);
		
		if (inputStream != null) {
			
			stmt.setBlob(7, inputStream);
		}
		
		int row=stmt.executeUpdate();
		if(row>0)
		{
			RequestDispatcher rd=request.getRequestDispatcher("bank-detail.jsp");
			request.setAttribute("email", email);
			request.setAttribute("transaction_id", transactionid);
			rd.forward(request, response);
		}
		
	} catch (SQLException e) {
		
		System.out.println(e);
		e.printStackTrace();
	}
    
    finally {
		if (con != null) {
			// closes the database connection
			try {
				con.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
    }	

	}
}
