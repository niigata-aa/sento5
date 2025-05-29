package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bean.CommentBean;
import model.DAO.CommentDAO;

/**
 * Servlet implementation class ComenServlet
 */
@WebServlet("/coment-regist-servlet")
public class CommentRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentRegistServlet() {
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
		
		String url ="commentRegistConfirm.jsp";
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		int genreId = Integer.parseInt(request.getParameter("genreId"));
		String review = request.getParameter("review");
		int rate = Integer.parseInt(request.getParameter("rate"));
		String commentPhoto = request.getParameter("commentPhoto");
		String menu = request.getParameter("menu");
		int value = Integer.parseInt(request.getParameter("value"));
		
		
		//DAOの生成
		CommentDAO commentdao = new CommentDAO();
		int processingNumber = 0;
		
		CommentBean comment = new CommentBean();
		comment.setUserId(userId);
		comment.setShopId(shopId);
		comment.setGenreId(genreId);
		comment.setReview(review);
		comment.setRate(rate);
		comment.setCommentPhoto(commentPhoto);
		comment.setMenu(menu);
		comment.setValue(value);
		try {
			//DAOの利用
			 processingNumber = commentdao.insertComment(comment);
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		//リクエストスコープへの属性の設定
		request.setAttribute("processingNumber", processingNumber);
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);

		}
	

}
