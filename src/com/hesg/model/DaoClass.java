package com.hesg.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.hesg.pojoClass.RegisterUserPojo;
import com.hesg.pojoClass.UserInfoPojo;

public class DaoClass {

	public boolean registerUser(RegisterUserPojo user) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		con = MyConnection.getMyConnection();
		String query = "insert into login_info(email,password) values(?,?)";

		con.prepareStatement(query);
		stmt = con.prepareStatement(query);
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());

		if (stmt.executeUpdate() > 0)
			return true;

		return false;
	}

	public boolean setUserInfo(UserInfoPojo obj) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;

		con = MyConnection.getMyConnection();
		String query = "insert into user_info(email,name,gender,dob,mobile,address,university,college,course,start,finish) values(?,?,?,?,?,?,?,?,?,?,?)";

		con.prepareStatement(query);
		stmt = con.prepareStatement(query);
		stmt.setString(1, obj.getEmail());
		stmt.setString(2, obj.getName());
		stmt.setString(3, obj.getGender());
		stmt.setString(4, obj.getDob());
		stmt.setString(5, obj.getMobile());
		stmt.setString(6, obj.getAddress());
		stmt.setString(7, obj.getUniversity());
		stmt.setString(8, obj.getCollege());
		stmt.setString(9, obj.getCourse());
		stmt.setString(10, obj.getStart());
		stmt.setString(11, obj.getFinish());

		if (stmt.executeUpdate() > 0)
			return true;

		return false;

	}

	public String validateUser(String username, String password) throws SQLException {

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from login_info where email=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, username);

		rs = stmt.executeQuery();

		while (rs.next()) {
			String pass = rs.getString(3);
			if (pass.equals(password)) {
				return rs.getString(4);
			}
		}

		return "invalid";
	}

	public boolean updateUserDetailRebate(UserInfoPojo obj) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		int p = 0;

		con = MyConnection.getMyConnection();
		String query = "update user_info set name='" + obj.getName() + "', address='" + obj.getAddress()
				+ "' , mobile='" + obj.getMobile() + "', university='" + obj.getUniversity() + "', college='"
				+ obj.getCollege() + "',course='" + obj.getCourse() + "' where email='" + obj.getEmail() + "'; ";

		stmt = con.createStatement();
		p = stmt.executeUpdate(query);

		if (p > 0) {
			return true;
		}

		return false;
	}

	public ResultSet displayUserDetail(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from user_info where email=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);

		rs = stmt.executeQuery();

		return rs;
	}

	public boolean updateBankDetail(String name, String bankname, String account, String id, String email)
			throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update expense_info set name='" + name + "', bankname='" + bankname + "', accountnumber='"
				+ account + "' where email='" + email + "' and transaction_id='" + id + "'";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}

		return false;
	}

	public ResultSet viewPendingGrant(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select id,name, transaction_id,category,transaction_cost,bankname ,status from expense_info where email=? and status=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);
		stmt.setString(2, "Pending");

		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewConfirmGrant(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select id,name, transaction_id,category,transaction_cost,bankname ,status from expense_info where email=? and status=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);
		stmt.setString(2, "Confirm");

		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet displayUserProfile(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from user_info where email=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);

		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet displayStudentRecord() throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from user_info";
		stmt = con.prepareStatement(query);

		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewStudentRecord(int id) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from user_info where id=?";
		stmt = con.prepareStatement(query);
		stmt.setInt(1, id);
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewPendingApplication() throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where status=? ";
		stmt = con.prepareStatement(query);
		stmt.setString(1, "Pending");
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewGrantedApplication() throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where status=? ";
		stmt = con.prepareStatement(query);
		stmt.setString(1, "Confirm");
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewCancelApplication() throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where status=? ";
		stmt = con.prepareStatement(query);
		stmt.setString(1, "Cancel");
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewPendingRecord(int refid) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where id=? ";
		stmt = con.prepareStatement(query);
		stmt.setInt(1, refid);
		rs = stmt.executeQuery();

		return rs;
	}

	public boolean updateApplicationStatus(String refid, String status, String remark) throws SQLException {
		int id = Integer.parseInt(refid);
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update expense_info set status='" + status + "', remark='" + remark + "' where id='" + id
				+ "';";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}

		return false;
	}

	public ResultSet viewCancelApplicationRecord(int id) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where id=? ";
		stmt = con.prepareStatement(query);
		stmt.setInt(1, id);
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewGrantApplicationRecord(int id) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where id=? ";
		stmt = con.prepareStatement(query);
		stmt.setInt(1, id);
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet trackApplicationDetail(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from expense_info where email=? ";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);
		rs = stmt.executeQuery();

		return rs;
	}

	public ResultSet viewCancelGrant(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select id,name, transaction_id,category,transaction_cost,bankname ,status, remark from expense_info where email=? and status=?";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);
		stmt.setString(2, "Cancel");

		rs = stmt.executeQuery();

		return rs;
	}
       
	public ResultSet getAdminDetails(String email) throws SQLException {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		con = MyConnection.getMyConnection();

		String query = "select * from admin_info where email=? ";
		stmt = con.prepareStatement(query);
		stmt.setString(1, email);
		rs = stmt.executeQuery();

		return rs;
	}
	
	public boolean updateAdminProfile(String email, String name, String  computecode) throws SQLException {
		int code = Integer.parseInt(computecode);
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update admin_info set name='" + name + "', computer_code='" + code + "' where email='" + email + "';";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}

		return false;
	}
	public boolean setNewPassword(String email, String newPassword) throws SQLException {
		Connection con = MyConnection.getMyConnection();
		Statement stmt = con.createStatement();
		String query = "update login_info set password='" + newPassword + "' where email='" + email + "' and  user_type='admin';";
		if (stmt.executeUpdate(query) > 0) {
			return true;
		}

		return false;
	}
	
	public int getStudentCount() throws SQLException {
	  
		 int count=0;
		 
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		con = MyConnection.getMyConnection();

		String query = "select count(*) as Count from user_info";
		stmt = con.prepareStatement(query);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1);
		}
		
		return count;
	}
	
	public int getGrantCount() throws SQLException {
		  
		 int count=0;
		 
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		con = MyConnection.getMyConnection();

		String query = "select count(status) from expense_info where status ='Confirm';";
		stmt = con.prepareStatement(query);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1);
		}
		
		return count;
	}
	public int getAmountDetails() throws SQLException {
		  
		 int amount=0;
		 
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		con = MyConnection.getMyConnection();

		String query = "select sum(transaction_cost) from expense_info where status=?;";
		stmt = con.prepareStatement(query);
		stmt.setString(1, "Confirm");
		rs = stmt.executeQuery();
		
		if(rs.next()){
			amount=rs.getInt(1);
		}
		
		return amount;
	}
	public int getCancelCount() throws SQLException {
		  
		 int count=0;
		 
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		con = MyConnection.getMyConnection();

		String query = "select count(status) from expense_info where status ='Cancel';";
		stmt = con.prepareStatement(query);
		rs = stmt.executeQuery();
		
		if(rs.next()){
			count=rs.getInt(1);
		}
		
		return count;
	}
	

	
}
