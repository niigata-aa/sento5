package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static final String URL ="jdbc:mysql://localhost:3306/noodledb";
	private static final String USER="ramenman";
	private static final String PASSWORD="sentou5";

	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		//ドライバの読み込み
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(URL,USER,PASSWORD);
		}
}
