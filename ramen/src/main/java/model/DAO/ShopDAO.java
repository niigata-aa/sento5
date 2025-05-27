package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import model.Bean.ShopBean;
public class ShopDAO {

	/**
	 * 店舗一覧を表示
	 * @return　shopAllList
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<ShopBean> selectAllshop()throws SQLException, ClassNotFoundException{
		List<ShopBean> shopAllList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop ";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
//				String genre = res.getString("genre_name");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);

				shopAllList.add(shop);
			}

		}
		return shopAllList;
	}

	/**
	 * 店舗IDで指定して、店舗情報を表示する
	 */
	public List<ShopBean> selectShop(int shopId) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop WHERE shop_id = ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1,shopId);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				String shopName = res.getString("shop_name");
				String shopKana = res.getString("shop_kana");
				String address = res.getString("address");
				Time openTime = res.getTime("open_time");
				Time closeTime = res.getTime("close_time");
				String closedDay = res.getString("closed_day");
				String shopPhoto = res.getString("photo");
				String detail = res.getString("detail");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setShopKana(shopKana);
				shop.setAddress(address);
				shop.setOpenTime(openTime);
				shop.setCloseTime(closeTime);
				shop.setClosedDay(closedDay);
				shop.setPhoto(shopPhoto);
				shop.setDetail(detail);

				shopList.add(shop);
			}

		}
		return shopList;
	}

	/**
	 * ジャンルIDで指定して、店舗一覧を表示する
	 */
	public List<ShopBean> selectGenreShop(int genreId) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopGenreList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop s JOIN m_comment c ON s.shop_id = c.shop_id WHERE c.genre_id = ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1,genreId);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);

				shopGenreList.add(shop);
			}

		}
		return shopGenreList;
	}

	/**
	 * 店名で指定して、店舗一覧を表示する
	 */
	public List<ShopBean> selectShopNameShop(String shopname) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopNameSearchList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROMFROM m_shop WHERE shop_name LIKE '%?%'";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1,shopname);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);

				shopNameSearchList.add(shop);
			}

		}
		return shopNameSearchList;
	}
	/**
	 * エリアで指定して、店舗一覧を表示する
	 */
	public List<ShopBean> selectAreaShop(String area) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopAreaList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM WHERE address LIKE '%?%'";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1,area);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);

				shopAreaList.add(shop);
			}

		}
		return shopAreaList;
	}
	/**
	 * 店舗削除
	 * @param shopId
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int deleteShop(int shopId) throws ClassNotFoundException, SQLException{

		int count=0;
		String sql="delete from m_shop where shop_id=?";
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			pstmt.setInt(1,shopId );

			count=pstmt.executeUpdate();
		}
		return count;
	}

	/**
	 * 店舗編集
	 * @param shop
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int updateShop(ShopBean shop)throws SQLException,ClassNotFoundException{


		String sql = "UPDATE m_shop "
				+ "SET shop_name = ?,shop_kana=?,address=?,open_time=?,close_time=?,closed_day=?,photo=?,detail=?"
				+ " WHERE shop_id=? ";


		int processingNumber = 0; //処理件数
		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			// DTOからのデータの取り出し
			int shopId = shop.getShopId();
			String shopName = shop.getShopName();
			String shopKana = shop.getShopKana();
			String address = shop.getAddress();
			Time openTime = shop.getOpenTime();
			Time closeTime = shop.getCloseTime();
			String closedDay = shop.getClosedDay();
			String photo = shop.getPhoto();
			String detail = shop.getDetail();

			// プレースホルダへの値の設定
			pstmt.setInt(1, shopId);
			pstmt.setString(2, shopName);
			pstmt.setString(3, shopKana);
			pstmt.setString(4, address);
			pstmt.setTime(5, openTime);
			pstmt.setTime(6, closeTime);
			pstmt.setString(7, closedDay);
			pstmt.setString(8, photo);
			pstmt.setString(9, detail);

			// SQLステートメントの実行
			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;


	}

	/**
	 * 店舗登録
	 * @param shop
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int insertShop(ShopBean shop) throws SQLException, ClassNotFoundException{
		int count=0;
		String sql = "insert into m_shop (shop_name,shop_kana,address,open_time,close_time,closed_day,photo,detail) values(?,?,?,?,?,?,?,?)";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			int shopId = shop.getShopId();
			String shopName = shop.getShopName();
			String shopKana = shop.getShopKana();
			String address = shop.getAddress();
			Time openTime = shop.getOpenTime();
			Time closeTime = shop.getCloseTime();
			String closed_day = shop.getClosedDay();
			String photo = shop.getPhoto();
			String detail = shop.getDetail();


			// プレースホルダへの値の設定
			pstmt.setInt(1, shopId);
			pstmt.setString(2, shopName);
			pstmt.setString(3, shopKana);
			pstmt.setString(4, address);
			pstmt.setTime(5, openTime);
			pstmt.setTime(6, closeTime);
			pstmt.setString(7, closed_day);
			pstmt.setString(8, photo);
			pstmt.setString(9, detail);

			count = pstmt.executeUpdate();

		}
		return count;

	}

}

