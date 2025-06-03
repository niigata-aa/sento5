package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public static List<ShopBean> selectAllshop()throws SQLException, ClassNotFoundException{
		List<ShopBean> shopAllList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop order by shop_id asc ";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
				boolean walkingDistance = res.getBoolean("walkDistance");
				//				String genre = res.getString("genre_name");
				

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);
				shop.setWalkingDistance(walkingDistance);

				shopAllList.add(shop);
			}

		}
		return shopAllList;
	}

	/**
	 * 店舗IDで指定して、店舗情報を表示する
	 */
	public ShopBean selectShop(int shopId) throws SQLException, ClassNotFoundException {
		ShopBean shop = new ShopBean();
		String sql = "SELECT * FROM m_shop WHERE shop_id = ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1,shopId);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				String shopName = res.getString("shop_name");
				String shopKana = res.getString("shop_kana");
				String address = res.getString("address");
				String openTime = res.getString("open_time");
				String closeTime = res.getString("close_time");
				String closedDay = res.getString("closed_day");
				String shopPhoto = res.getString("photo");
				String detail = res.getString("detail");
				boolean walkingDistance = res.getBoolean("walkDistance");

				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setShopKana(shopKana);
				shop.setAddress(address);
				shop.setOpenTime(openTime);
				shop.setCloseTime(closeTime);
				shop.setClosedDay(closedDay);
				shop.setPhoto(shopPhoto);
				shop.setDetail(detail);
				shop.setWalkingDistance(walkingDistance);

			}

		}
		return shop;
	}

	/**
	 * ジャンルIDで指定して、店舗一覧を表示する
	 */
	public List<ShopBean> selectGenreShop(int genreId) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopGenreList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop s JOIN m_shop c ON s.shop_id = c.shop_id WHERE c.genre_id = ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setInt(1,genreId);
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
				boolean walkingDistance = res.getBoolean("walkDistance");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);
				shop.setWalkingDistance(walkingDistance);

				shopGenreList.add(shop);
			}

		}
		return shopGenreList;
	}

	/**
	 * 店名で指定して、店舗一覧を表示する
	 */
	public static List<ShopBean> selectShopNameShop(String shopname) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopNameSearchList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop WHERE shop_name LIKE ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1,"%"+shopname+"%");
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
				boolean walkingDistance = res.getBoolean("walkDistance");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);
				shop.setWalkingDistance(walkingDistance);
				
				shopNameSearchList.add(shop);
			}

		}
		return shopNameSearchList;
	}
	/**
	 * エリアで指定して、店舗一覧を表示する
	 */
	public static List<ShopBean> selectAreaShop(String area) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopAreaList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop WHERE address LIKE ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1,"%"+area+"%");
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
				boolean walkingDistance = res.getBoolean("walkDistance");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);
				shop.setWalkingDistance(walkingDistance);
				
				shopAreaList.add(shop);
			}

		}
		return shopAreaList;
	}
	
	/**
	 * 店舗検索、エリア検索両方入力
	 */
	public static List<ShopBean> selectShopNameAndAreaShop(String shopname, String area) throws SQLException, ClassNotFoundException {
		List<ShopBean> shopAndList = new ArrayList<ShopBean>();
		String sql = "SELECT * FROM m_shop WHERE shop_name LIKE ? AND address LIKE ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			pstmt.setString(1,"%"+shopname+"%");
			pstmt.setString(2,"%"+area+"%");
			ResultSet res = pstmt.executeQuery();

			while(res.next()) {
				int shopId = res.getInt("shop_id");
				String shopName = res.getString("shop_name");
				String shopPhoto = res.getString("photo");
				boolean walkingDistance = res.getBoolean("walkDistance");

				ShopBean shop = new ShopBean();
				shop.setShopId(shopId);
				shop.setShopName(shopName);
				shop.setPhoto(shopPhoto);
				shop.setWalkingDistance(walkingDistance);

				shopAndList.add(shop);
			}

		}
		return shopAndList;
	}
	
	//店舗平均評価点計算
	public List<ShopBean> shopRank(int shopId) throws SQLException, ClassNotFoundException{
		List<ShopBean> shoprankList = new ArrayList<ShopBean>();
		
		String sql ="SELECT AVG(rate) AS average_rate FROM m_comment WHERE shop_id = ? ORDER BY average_rate LIMIT 5 " ; 
		
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){
			pstmt.setInt(1,shopId);
			
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				ShopBean shop = new ShopBean();
				shop.setAverageRate(res.getInt("average_rate"));
				shoprankList.add(shop);
			}
		}
		return shoprankList;
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
		String sql="DELETE FROM m_shop WHERE shop_id=?";
		try(Connection con=ConnectionManager.getConnection();
				PreparedStatement pstmt=con.prepareStatement(sql)){

			pstmt.setInt(1,shopId );

			count=pstmt.executeUpdate();
		}
		return count;
	}

	/**
	 * 店舗削除
	 * @param shopId
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public int deleteShopComment(int shopId) throws ClassNotFoundException, SQLException{

		int count=0;
		String sql="DELETE FROM m_comment WHERE shop_id=?";
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
				+ "SET shop_name = ?,shop_kana=?,address=?,open_time=?,close_time=?,closed_day=?,photo=?,detail=?, walkDistance=?"
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
			String openTime = shop.getOpenTime();
			String closeTime = shop.getCloseTime();
			String closedDay = shop.getClosedDay();
			String photo = shop.getPhoto();
			String detail = shop.getDetail();
			boolean walkingDistanceStr = shop.isWalkingDistance();

			// プレースホルダへの値の設定

			pstmt.setString(1, shopName);
			pstmt.setString(2, shopKana);
			pstmt.setString(3, address);
			pstmt.setString(4, openTime);
			pstmt.setString(5, closeTime);
			pstmt.setString(6, closedDay);
			pstmt.setString(7, photo);
			pstmt.setString(8, detail);
			pstmt.setInt(10, shopId);
			pstmt.setBoolean(9, walkingDistanceStr);
			

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
		String sql = "INSERT INTO m_shop (shop_name,shop_kana,address,open_time,close_time,closed_day,photo,detail, walkDistance) VALUES(?,?,?,?,?,?,?,?,?)";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			String shopName = shop.getShopName();
			String shopKana = shop.getShopKana();
			String address = shop.getAddress();
			String openTime = shop.getOpenTime();
			String closeTime = shop.getCloseTime();
			String closedDay = shop.getClosedDay();
			String photo = shop.getPhoto();
			String detail = shop.getDetail();
            boolean walkingDistanceStr = shop.isWalkingDistance();

			// プレースホルダへの値の設定
			pstmt.setString(1, shopName);
			pstmt.setString(2, shopKana);
			pstmt.setString(3, address);
			pstmt.setString(4, openTime);
			pstmt.setString(5, closeTime);
			pstmt.setString(6, closedDay);
			pstmt.setString(7, photo);
			pstmt.setString(8, detail);
			pstmt.setBoolean(9, walkingDistanceStr);

			count = pstmt.executeUpdate();

		}
		return count;

	}
	public static  String selectShopName(int shopId) throws ClassNotFoundException, SQLException {
        String shopName = null; // 戻り値を保持する変数を初期化
        String sql = "select * from m_shop where shop_id=?";

        try (Connection con = ConnectionManager.getConnection(); // ConnectionManagerはConnectionを返すクラスと仮定
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, shopId);
            ResultSet res = pstmt.executeQuery();

            // 結果セットにデータがあるか確認
            if (res.next()) {
                // shopNameカラムの値を取得
                shopName = res.getString("shop_name");
            }
            
        }
       
        return shopName; // 取得したshopNameを返す
    }

			

	
	
	
//5/30追加分////////////////////////////////////////////////////
	
	public List<ShopBean> selectShopByMultipleConditions(String shopName, String area, Integer genreId)
		       throws SQLException, ClassNotFoundException {
		   List<ShopBean> shopList = new ArrayList<ShopBean>();
		   StringBuilder sql = new StringBuilder();
		   
		   sql.append("SELECT DISTINCT s.shop_id, s.shop_name, s.photo, s.walkDistance, ");
		   sql.append("GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', ') AS genres ");
		   sql.append("FROM m_shop s ");
		   
		   if (genreId != null) {
		       // ジャンル指定がある場合は、そのジャンルでフィルタリング
		       sql.append("INNER JOIN m_comment c ON s.shop_id = c.shop_id ");
		       sql.append("INNER JOIN m_genre g ON c.genre_id = g.genre_id ");
		   } else {
		       // ジャンル指定がない場合は、すべてのジャンル情報を取得
		       sql.append("LEFT JOIN m_comment c ON s.shop_id = c.shop_id ");
		       sql.append("LEFT JOIN m_genre g ON c.genre_id = g.genre_id ");
		   }
		   
		   boolean hasCondition = false;
		   
		   if (shopName != null && !shopName.trim().isEmpty()) {
		       sql.append(hasCondition ? " AND" : " WHERE");
		       sql.append(" s.shop_name LIKE ?");
		       hasCondition = true;
		   }
		   if (area != null && !area.trim().isEmpty()) {
		       sql.append(hasCondition ? " AND" : " WHERE");
		       sql.append(" s.address LIKE ?");
		       hasCondition = true;
		   }
		   if (genreId != null) {
		       sql.append(hasCondition ? " AND" : " WHERE");
		       sql.append(" c.genre_id = ?");
		       hasCondition = true;
		   }
		   
		   sql.append(" GROUP BY s.shop_id, s.shop_name, s.photo, s.walkDistance");
		  
		   try(Connection con = ConnectionManager.getConnection();
		           PreparedStatement pstmt = con.prepareStatement(sql.toString())){


		       int placeholder = 1; //プレースホルダーを入力によって調整
		      
		       if (shopName != null && !shopName.trim().isEmpty()) {
		           pstmt.setString(placeholder++, "%" + shopName + "%");
		       }
		       if (area != null && !area.trim().isEmpty()) {
		           pstmt.setString(placeholder++, "%" + area + "%");
		       }
		       if (genreId != null) {
		    	   pstmt.setInt(placeholder++, genreId);
		       }
		      
		       ResultSet res = pstmt.executeQuery();


		       while(res.next()) {
		           int shopId = res.getInt("shop_id");
		           String shopNameResult = res.getString("shop_name");
		           String shopPhoto = res.getString("photo");
		           boolean walkingDistance = res.getBoolean("walkDistance");
		           String genres = res.getString("genres"); // 複数ジャンルを取得


		           ShopBean shop = new ShopBean();
		           shop.setShopId(shopId);
		           shop.setShopName(shopNameResult);
		           shop.setPhoto(shopPhoto);
		           shop.setWalkingDistance(walkingDistance);
		           shop.setGenre(genres); // ジャンル情報を設定

		          
//		           if (genreId != null) {
//		               shop.setGenre(res.getString("genre_name"));
//		           }


		           shopList.add(shop);
		       }
		   }
		   return shopList;
		}

	
	public static List<ShopBean> selectAllShopWithGenre() throws SQLException, ClassNotFoundException {
	    List<ShopBean> shopList = new ArrayList<ShopBean>();
	    
	    String sql = "SELECT DISTINCT s.shop_id, s.shop_name, s.photo, s.walkDistance, " +
	                 "GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', ') AS genres " +
	                 "FROM m_shop s " +
	                 "LEFT JOIN m_comment c ON s.shop_id = c.shop_id " +
	                 "LEFT JOIN m_genre g ON c.genre_id = g.genre_id " +
	                 "GROUP BY s.shop_id, s.shop_name, s.photo, s.walkDistance";
	                  
	    
	    try(Connection con = ConnectionManager.getConnection();
	            PreparedStatement pstmt = con.prepareStatement(sql)){

	        ResultSet res = pstmt.executeQuery();

	        while(res.next()) {
	            int shopId = res.getInt("shop_id");
	            String shopName = res.getString("shop_name");
	            String shopPhoto = res.getString("photo");
	            boolean walkingDistance = res.getBoolean("walkDistance");
	            String genres = res.getString("genres");

	            ShopBean shop = new ShopBean();
	            shop.setShopId(shopId);
	            shop.setShopName(shopName);
	            shop.setPhoto(shopPhoto);
	            shop.setWalkingDistance(walkingDistance);
	            shop.setGenre(genres); // 複数ジャンルをカンマ区切りで設定

	            shopList.add(shop);
	        }
	    }
	    return shopList;
	}


	
}

