package model.Bean;

import java.io.Serializable;

public class CommentBean implements Serializable {
	/**
	 * コメントID
	 */
	private int commentId;
	
	/**
	 * ユーザID
	 */
	private int userId;
	
	/**
	 * 店舗ID
	 */
	private int shopId;
	
	/**
	 * ジャンルID 
	 */
	private int genreId;
	
	/**
	 * レビュー
	 */
	private String review;
	
	/**
	 * 評価
	 */
	private String rate;
	
	/**
	 * コメントの写真
	 */
	private String commentPhoto;
	
	
	/**
	 * メニュー
	 */
	private String menu;
	
	/**
	 * 値段
	 */
	private int value;
	
	public CommentBean() {
		
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getCommentPhoto() {
		return commentPhoto;
	}

	public void setCommentPhoto(String commentPhoto) {
		this.commentPhoto = commentPhoto;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	

}
