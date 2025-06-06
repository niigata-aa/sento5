package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bean.ShopBean;

public class RankingDAO {

	//店舗平均評価点計算
		public List<ShopBean> shopRank() throws SQLException, ClassNotFoundException{
			List<ShopBean> shoprankList = new ArrayList<ShopBean>();
			
			String sql ="SELECT AVG(c.rate) AS average_rate,shop_name,s.photo, s.shop_id FROM m_comment c INNER JOIN m_shop s ON c.shop_id = s.shop_id GROUP BY s.shop_id ORDER BY average_rate DESC LIMIT 5" ; 
			
			try(Connection con=ConnectionManager.getConnection();
					PreparedStatement pstmt=con.prepareStatement(sql)){
				
				
				ResultSet res = pstmt.executeQuery();
				
				while(res.next()) {
					ShopBean shop = new ShopBean();
					shop.setAverageRate(res.getDouble("average_rate"));
					shop.setShopName(res.getString("shop_name"));
					shop.setPhoto(res.getString("photo"));
					shop.setShopId(res.getInt("shop_id"));
					shoprankList.add(shop);
				}
			}
			return shoprankList;
			}
}
