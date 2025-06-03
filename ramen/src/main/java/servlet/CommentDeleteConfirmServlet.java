package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO.GenreDAO;
import model.DAO.ShopDAO;

/**
 * Servlet implementation class ComentDeleteConfirmServlet
 */
@WebServlet("/coment-delete-confirm-servlet")
public class CommentDeleteConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteConfirmServlet() {
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
		
		ShopDAO shopDao=new ShopDAO();
		String shopName=null;
		GenreDAO genreDao=new GenreDAO();
		String genreName=null;
		
		String shopname=request.getParameter("shopname");
		int commentId=Integer.parseInt(request.getParameter("commentId"));
		int shopId=Integer.parseInt(request.getParameter("shopId"));
		int genreId=Integer.parseInt(request.getParameter("genreId"));
		String review=request.getParameter("review");
		String rate=request.getParameter("rate");
		String commentPhoto=request.getParameter("commentPhoto");
		String menu=request.getParameter("menu");
		String value=request.getParameter("value");
		
		try {
			 shopName = shopDao.selectShopName(shopId);
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		try {
			 genreName = genreDao.selectGenreName(genreId);
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("shopname",shopname );
		session.setAttribute("shopName",shopName );
		session.setAttribute("commentId",commentId );
		session.setAttribute("genreName",genreName );
		request.setAttribute("genreId",genreId );
		request.setAttribute("review",review );
		request.setAttribute("rate",rate );
		request.setAttribute("commentPhoto",commentPhoto );
		request.setAttribute("menu",menu );
		request.setAttribute("value",value );
		RequestDispatcher rd = request.getRequestDispatcher("commentDeleteConfirm.jsp");
		
		rd.forward(request, response);
	}

}
