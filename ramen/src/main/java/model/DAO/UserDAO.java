package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Bean.UserBean;

public class UserDAO {
	/**
	 * ログインのチェックを行う。
	 * @param userId
	 * @param password
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean loginCheck(int userId, String password) throws SQLException, ClassNotFoundException{
		String sql = "SELECT * FROM m_user WHERE user_id=? AND password =?";
		
		// データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			//プレースホルダーへの値の設定
			pstmt.setInt(1, userId);
			pstmt.setString(2, password);
			
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 権限のチェックを行う。
	 * @param roll
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public boolean rollCheck(int roll) throws SQLException, ClassNotFoundException{
		String sql = "SELECT * FROM m_user WHERE roll = 0";
		
		// データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			//プレースホルダーへの値の設定
			pstmt.setInt(1, roll);
						
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * すべてのユーザのリストを返す。
	 * 
	 * @return ユーザのリスト
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<UserBean>selectAll() throws SQLException, ClassNotFoundException{
		List<UserBean> userList = new ArrayList<UserBean>();
		
		String sql = "SELECT * FROM m_user";
		
		// データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery(sql)){
			
			while(res.next()) {
				UserBean user = new UserBean();
				user.setUserId(res.getInt("user_id"));
				user.setUserName(res.getString("name"));
				userList.add(user);
			}
		}
		return userList;
	}
	
	/**
	 * ユーザの登録を行う。
	 * 
	 * @param userid
	 * @param username
	 * @param password
	 * @param roll
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int insertUser(int userId, String userName, String password) throws SQLException, ClassNotFoundException{
		String sql = "INSERT INTO m_user(user_id, user_name, password) VALUES (?, ?, ?)";
		int result = 0;	
		
		// データベースへの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			//プレースホルダーへの値の設定
			pstmt.setInt(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, password);
			
			// SQLステートメントの実行
			result = pstmt.executeUpdate();
		}
		return result;
		
	}
	
	/**
	 * ユーザの削除を行う。
	 * 
	 * @param userId
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int deleteUser(int userId) throws SQLException, ClassNotFoundException{
		
		String sql = "DELETE FROM m_user WHERE user_id=?";

		int count = 0;

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			//プレースホルダーへの値の設定
			pstmt.setInt(1, userId);
			
			// SQLステートメントの実行
			count = pstmt.executeUpdate(sql);
		}

		return count;
	}
}
