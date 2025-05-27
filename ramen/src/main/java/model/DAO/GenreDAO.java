package model.DAO;

	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bean.GenreBean;

	/*
	 *m_genreテーブルのDAO 
	 * @return genrelist
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */

	public class GenreDAO {

		public List<GenreBean> selectCategory() throws SQLException, ClassNotFoundException{
			
			List<GenreBean> genrelist = new ArrayList<GenreBean>();
			
			String sql = "select genre_name from m_genre";
			
			try(Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet res = pstmt.executeQuery()){
				
				while (res.next()) {
					String GenreName = res.getString("GenreName");
					
					GenreBean genre = new GenreBean();
					genre.setGenreName(GenreName);
				}
			}catch(SQLException e) {
				System.out.print(e);
				e.printStackTrace();
				throw e;
			}
			return genrelist;
			
		}
		
	}



