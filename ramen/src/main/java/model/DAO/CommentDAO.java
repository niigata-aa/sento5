package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bean.CommentBean;

public class CommentDAO {


	/**
	 * コメント削除
	 * @return count
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int deleteComment(int commentId)throws SQLException, ClassNotFoundException {

		int count = 0;

		String sql = "delete from m_comment where comment_id = ?";

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1,commentId);
			count = pstmt.executeUpdate();
		}catch(SQLException e){
			System.out.print(e);
			e.printStackTrace();
			throw e;
		}

		return count;

	}


	/**
	 * コメント追加
	 * @return count
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public int insertComment(CommentBean comment)throws SQLException, ClassNotFoundException{

		//ユーザid、店舗id、ジャンルidインポートとゲット追加
		String sql = "insert into m_comment (user_id, shop_id, genre_id,review, rate, comment_photo, menu, value) values (?,?,?,?,?,?,?,?)";

		int count = 0;

		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, comment.getUserId());
			pstmt.setInt(2, comment.getShopId());
			pstmt.setInt(3, comment.getGenreId());
			pstmt.setString(4, comment.getReview());
			pstmt.setString(5, comment.getRate());
			pstmt.setString(6, comment.getCommentPhoto());
			pstmt.setString(7, comment.getMenu());
			pstmt.setString(8, comment.getValue());

			count = pstmt.executeUpdate();

		}catch(SQLException e) {
			System.out.print(e);
			e.printStackTrace();
			throw e;
		}
		return count;
	}
	//shopIdごとにコメントを取得する
	public List<CommentBean> selectComment(int shopId) throws SQLException, ClassNotFoundException{
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		CommentBean comment = new CommentBean();

		String sql = "SELECT * from m_comment where shop_id = ?";

		//データベースの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setInt(1,shopId);

			//SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				comment.setCommentId(res.getInt("comment_id"));
				comment.setUserId(res.getInt("user_id"));
				comment.setShopId(res.getInt("shop_id"));
				comment.setGenreId(res.getInt("genre_id"));
				comment.setReview(res.getString("review"));
				comment.setRate(res.getString("rate"));
				comment.setCommentPhoto(res.getString("comment_photo"));
				comment.setMenu(res.getString("menu"));
				comment.setValue(res.getString("value"));
				
				commentList.add(comment);


			}
		}
		return commentList;


	}

	//ジャンルでコメントを検索
	public List<CommentBean> selectCategoryComment(int genreId)throws SQLException, ClassNotFoundException{

		List<CommentBean> commentCategoryList = new ArrayList<CommentBean>();
		CommentBean comment = new CommentBean();

		String sql = "SELECT * from m_comment where genre_id = ?";

		//データベースの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setInt(1,genreId);

			//SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				comment.setCommentId(res.getInt("comment_id"));
				comment.setUserId(res.getInt("user_id"));
				comment.setShopId(res.getInt("shop_id"));
				comment.setGenreId(res.getInt("genre_id"));
				comment.setReview(res.getString("review"));
				comment.setRate(res.getString("rate"));
				comment.setCommentPhoto(res.getString("comment_photo"));
				comment.setMenu(res.getString("menu"));
				comment.setValue(res.getString("value"));

				commentCategoryList.add(comment);

			}

		}

		return commentCategoryList;
	}

	//ユーザでコメントを検索
	public List<CommentBean> selectUserComment(int userId)
			throws SQLException, ClassNotFoundException{
		List<CommentBean> commentUserList = new ArrayList<CommentBean>();
		

		String sql = "SELECT * from m_comment where user_id = ?";

		//データベースの接続の取得、PreparedStatementの取得
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){

			//プレースホルダへの値の設定
			pstmt.setInt(1,userId);

			//SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				CommentBean comment = new CommentBean();
				comment.setCommentId(res.getInt("comment_id"));
				comment.setUserId(res.getInt("user_id"));
				comment.setShopId(res.getInt("shop_id"));
				comment.setGenreId(res.getInt("genre_id"));
				comment.setReview(res.getString("review"));
				comment.setRate(res.getString("rate"));
				comment.setCommentPhoto(res.getString("comment_photo"));
				comment.setMenu(res.getString("menu"));
				comment.setValue(res.getString("value"));

				commentUserList.add(comment);

			}

		}

		return commentUserList;
	}

}


