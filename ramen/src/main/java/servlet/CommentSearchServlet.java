package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bean.CommentBean;
import model.DAO.CommentDAO;

/**
 * Servlet implementation class ComentSearchServlet
 */
@WebServlet("/coment-search-servlet")
public class CommentSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		int genreId=Integer.parseInt(request.getParameter("genreserch"));
		int shopId=Integer.parseInt(request.getParameter("shopId"));

		List<CommentBean> commentList=null;

		CommentDAO dao=new CommentDAO();


			// 検索条件に応じた店舗検索
			if ((genreId>0) && (genreId<9)) {
				// 全店舗
				try {
					commentList =dao.selectCategoryComment((genreId),shopId);
					
				} catch (ClassNotFoundException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
				

			} else {
					try {
						commentList = dao.selectComment(shopId);
					} catch (NumberFormatException e) {
						// TODO 自動生成された catch ブロック
						e.printStackTrace();
					} catch (ClassNotFoundException e) {
						// TODO 自動生成された catch ブロック
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO 自動生成された catch ブロック
						e.printStackTrace();
					}
			}


			request.setAttribute("commentList", commentList);

			RequestDispatcher rd = request.getRequestDispatcher("shopDetail.jsp");

			rd.forward(request, response);
	

	}
}
