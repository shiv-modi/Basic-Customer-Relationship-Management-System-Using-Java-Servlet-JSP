package com.crm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.crm.interfaces.inter;

public class Dba implements inter{
	
	Connection conn;
	
	DbCon con = new DbCon();

	
	 public Dba() {
		try {
			this.conn = con.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public boolean addUsers(Users add) {
		String query = "INSERT INTO users (username, email, password, role) VALUES(?, ?, ?, ?)";

		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, add.getUsername());
			preparedStatement.setString(2, add.getEmail());
			preparedStatement.setString(3, add.getPassword());
			preparedStatement.setString(4, add.getRole());
			int rowAffect = preparedStatement.executeUpdate();
			if (rowAffect > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		return false;
	}
	
	
	public boolean userExist(Users user) {
		String query = "SELECT * FROM users WHERE email = ? AND password = ?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,user.getEmail());
			preparedStatement.setString(2,user.getPassword());
			ResultSet rSet = preparedStatement.executeQuery();
			if (rSet.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean addCustomer(Users addCustome) {
		String query = "INSERT INTO customers (customer_name, customer_email, customer_phone, customer_join_date) VALUES(?,?,?,?)";
		
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,addCustome.getUsername());
			preparedStatement.setString(2,addCustome.getEmail());
			preparedStatement.setString(3,addCustome.getPhone());
			preparedStatement.setString(4,addCustome.getRole());
			int rowsAffect = preparedStatement.executeUpdate();
			if (rowsAffect > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Users> viewCustomers() {
	    List<Users> customerDataSet = new ArrayList<>();
	    String query = "SELECT * FROM customers";

	    try (Statement statement = conn.createStatement();
	         ResultSet resultSet = statement.executeQuery(query)) {
	        
	        while (resultSet.next()) {
	            Users ccUsers = new Users();
	            ccUsers.setId(resultSet.getInt("customer_id"));
	            ccUsers.setUsername(resultSet.getString("customer_name"));
	            ccUsers.setEmail(resultSet.getString("customer_email"));
	            ccUsers.setPhone(resultSet.getString("customer_phone"));
	            ccUsers.setRole(resultSet.getString("customer_join_date"));
	            customerDataSet.add(ccUsers);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace(); // Log the exception (consider using a logging framework in production)
	    }

	    return customerDataSet;
	}
	
	public boolean editCustomer(Users editCustomer) {
		String query = "UPDATE customers SET customer_name = ? , customer_email = ? , customer_phone = ? , customer_join_date = ? WHERE ((customer_name = ? AND customer_phone = ?) OR (customer_email = ?));";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,editCustomer.getUsername());
			preparedStatement.setString(2,editCustomer.getEmail());
			preparedStatement.setString(3,editCustomer.getPhone());
			preparedStatement.setString(4,editCustomer.getRole());
			preparedStatement.setString(5,editCustomer.getUsername());
			preparedStatement.setString(6,editCustomer.getPhone());
			preparedStatement.setString(7,editCustomer.getEmail());
			int rowsAffect = preparedStatement.executeUpdate();
			if (rowsAffect > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delCust(Users deleteCustomer) {
		String qString = "DELETE FROM customers WHERE customer_email = ?";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(qString);
			preparedStatement.setString(1,deleteCustomer.getEmail());
			int rowAffect = preparedStatement.executeUpdate();
			if (rowAffect > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public String getCustomerName(Users cemail){
		String query = "SELECT customer_name FROM customers WHERE customer_email = ?";
		String name = null;
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,cemail.getEmail());
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				return  name = resultSet.getString("customer_name");
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return name;
	}
	
	public boolean interac(Users addInter) {
		String query = "INSERT INTO interactions (customer_name,customer_email,interaction_type,details,interaction_date) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1,addInter.getUsername());
			preparedStatement.setString(2,addInter.getEmail());
			preparedStatement.setString(3,addInter.getInteractionType());
			preparedStatement.setString(4,addInter.getDetails());
			preparedStatement.setString(5,addInter.getDateTime());
			int rowsAffect = preparedStatement.executeUpdate();
			if (rowsAffect > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Users> getInteractions(String email) {
		
		List<Users>newListInteraction = new ArrayList<Users>();
		String qwery = "SELECT * FROM interactions WHERE customer_email = ? ORDER BY id DESC";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(qwery);
			preparedStatement.setString(1,email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Users fetchUsers = new Users();
				fetchUsers.setId(resultSet.getInt("id"));
				fetchUsers.setUsername(resultSet.getString("customer_name"));
				fetchUsers.setEmail(resultSet.getString("customer_email"));
				fetchUsers.setInteractionType(resultSet.getString("interaction_type"));
				fetchUsers.setDetails(resultSet.getString("details"));
				fetchUsers.setDateTime(resultSet.getString("interaction_date"));
				newListInteraction.add(fetchUsers);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newListInteraction;
	}
	
	public String DeleteInteraction(Users user_if) {
	    String selectQuery = "SELECT customer_email FROM interactions WHERE id = ?";
	    String deleteQuery = "DELETE FROM interactions WHERE id = ?";
	    String email = null;
	    try {
	        // Retrieve the email
	        PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
	        selectStatement.setInt(1, user_if.getId());
	        ResultSet resultSet = selectStatement.executeQuery();
	        if (resultSet.next()) {
	            email = resultSet.getString("customer_email");
	        }

	        // Delete the record
	        PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
	        deleteStatement.setInt(1, user_if.getId());
	        deleteStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return email;
	}


}
