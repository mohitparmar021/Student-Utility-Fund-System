
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Receipt</title>
</head>
<body>

	<%
		String refid = (String) request.getParameter("ref");
		int id = Integer.parseInt(refid);

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		Blob image = null;
		byte[] imgData = null;

		try {
			con = MyConnection.getMyConnection();
			String query = "select * from expense_info where id=?";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				image = rs.getBlob(8);
				imgData = image.getBytes(1, (int) image.length());
			} else {
				out.println("Display Blob Example");
				out.println("image not found for given id>");
				return;
			}
			response.setContentType("image/jpg");
			OutputStream o = response.getOutputStream();
			o.write(imgData);
			o.flush();
			o.close();
			
		} catch (Exception e) {
			out.println("Unable To Display image");
			out.println("Image Display Error=" + e.getMessage());
			return;
		}
	%>



</body>
</html>