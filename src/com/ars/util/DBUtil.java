package com.ars.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	public static Connection getConnection() {
		/*
		 * ResourceBundle rb = ResourceBundle.getBundle("ars");
		 * 
		 * String driver = rb.getString("driver");// "com.mysql.jdbc.Driver"; String url
		 * = rb.getString("url");// "jdbc:mysql://127.0.0.1:3306/hoteliday"; String
		 * username = rb.getString("username");// "root"; String password =
		 * rb.getString("password");// "root";
		 */		Connection cn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); // driver
			// cn = DriverManager.getConnection(url, username, password);
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightreservationsystem", "root", "root");
		} catch (ClassNotFoundException | SQLException e) {
System.out.println(e);
		}

		return cn;
	}

	public static void main(String[] args) {

		System.out.println("Inside DBUTIL------" + DBUtil.getConnection());
	}

}
