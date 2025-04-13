package com.crm.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DbCon {
	
	public final String url = "jdbc:mysql://localhost:3306/YOUR_USERNAME";
	public final String username = "YOUR_USERNAME";
	public final String password = "YOUR_PASSWORD";
	
	protected Connection getConnection() throws ClassNotFoundException{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Class Loaded");
			try {
				return DriverManager.getConnection(url,username,password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("Error in class");
		}
		return null;
	}
	
}
