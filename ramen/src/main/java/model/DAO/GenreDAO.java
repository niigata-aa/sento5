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
				String genreName = res.getString("genre_name");
				int genreId = res.getInt("genre_id");

				GenreBean genre = new GenreBean();
				genre.setGenreName(genreName);
				genre.setGenreId(genreId);

				genreList.add(genre);
			}

		}
		return genreList;

	}
	/**
	 * ジャンルIDを指定してジャンル名を呼び出す
	 * @param genreId
	 * @return　ジャンル名
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public String selectGenreName(int genreId) throws SQLException, ClassNotFoundException {
		String genreName=null;
		String sql = "SELECT * FROM m_genre WHERE genre_id = ?";


		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1,genreId);
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				genreName = res.getString("genre_name");
			}
			return genreName;

		}
	}
}




