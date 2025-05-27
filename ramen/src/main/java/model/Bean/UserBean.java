package model.Bean;

import java.io.Serializable;

public class UserBean implements Serializable{
	/**:
	 * ユーザID
	 */
	private int userId;
	
	/**
	 * ユーザネーム
	 */
	private String userName;
	
	/**
	 * パスワード
	 */
	private String password;
	
	/**
	 * 管理者権限用（０：管理者、１：ユーザ）
	 */
	private int roll;
	
	public UserBean() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRoll() {
		return roll;
	}

	public void setRoll(int roll) {
		this.roll = roll;
	}
	
	

}
