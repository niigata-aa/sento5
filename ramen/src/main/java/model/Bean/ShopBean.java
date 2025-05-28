package model.Bean;

import java.io.Serializable;


public class ShopBean implements Serializable{

	/**
	 * 店舗ID
	 */
	private int shopId;
	
	/**
	 * 店舗名
	 */
	private String shopName;
	
	/**
	 * 店舗かな
	 */
	private String shopKana;
	
	/**
	 * 店舗住所
	 */
	private String address;
	
	/**
	 * 開店時間
	 */
	private String openTime;
	
	/**
	 * 閉店時間
	 */
	private String closeTime;
	
	/**
	 * 定休日
	 */
	private String closedDay;
	
	/**
	 * 店舗写真のパス
	 */
	private String photo;
	
	/**
	 * 店舗詳細
	 */
	private String detail;
	
	private String genre;
	
	public ShopBean() {
		
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopKana() {
		return shopKana;
	}

	public void setShopKana(String shopKana) {
		this.shopKana = shopKana;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getClosedDay() {
		return closedDay;
	}

	public void setClosedDay(String closedDay) {
		this.closedDay = closedDay;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	
	
}
