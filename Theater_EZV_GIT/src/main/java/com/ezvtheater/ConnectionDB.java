package com.ezvtheater;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ConnectionDB {
	private static ConnectionDB cdb = new ConnectionDB();
	
	private ConnectionDB() {}
	
	public static ConnectionDB getInstance() {
		return cdb;
	}
	

	public Connection getConnection() throws Exception {
		Context initctx = new InitialContext();
		DataSource ds = (DataSource) initctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close(Connection con, PreparedStatement pstmt) {
		try {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
