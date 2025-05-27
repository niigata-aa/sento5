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

		public List<GenreBean> selectGenre() throws SQLException, ClassNotFoundException{
			
			List<GenreBean> genreList = new ArrayList<GenreBean>();
			
			String sql = "select * from m_genre";
			
			try(Connection con = ConnectionManager.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet res = pstmt.executeQuery()){
				
				while (res.next()) {
					String genreName = res.getString("genreName");
					int genreId = res.getInt("gnreId");
					
					GenreBean genre = new GenreBean();
					genre.setGenreName(genreName);
					genre.setGenreId(genreId);
					
					genreList.add(genre);
				}
			
			}
			return genreList;
			
		}
		
	}



