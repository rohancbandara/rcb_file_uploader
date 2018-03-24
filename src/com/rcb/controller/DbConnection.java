package com.rcb.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DbConnection {

	static String url = "jdbc:mysql://localhost:3307/blob";

	public static Connection con() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1 = DriverManager.getConnection(url, "root", "kaththa");

		return con1;
	}

	public void putData(String sql) throws Exception {
		Statement st = con().createStatement();
		st.executeUpdate(sql);
		con().close();
	}

	public ResultSet getData(String sql) throws Exception {
		Statement st = con().createStatement();
		ResultSet rs = st.executeQuery(sql);
		con().close();
		return rs;
	}

	public static void main(String args[]) {
		try {
			DbConnection db = new DbConnection();
			System.out.println("sucess");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
