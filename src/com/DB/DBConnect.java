package com.DB;

import java.sql.DriverManager;

import java.sql.Connection;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn(){
		try {
			if(conn == null){
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore?characterEncoding=UTF-8","root","root");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return conn;
	}
}
