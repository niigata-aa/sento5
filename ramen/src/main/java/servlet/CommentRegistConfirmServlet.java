package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Bean.CommentBean;
import model.Bean.ShopBean;

/**
 * Servlet implementation class ComentRegistConfirmServlet
 */
@WebServlet("/comment-regist-confirm-servlet")
public class CommentRegistConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentRegistConfirmServlet() {
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
		HttpSession session = request.getSession();
		ShopBean shop = (ShopBean) session.getAttribute("shop");
		
		//リクエストパラメータの取得
		int shopId = (int)shop.getShopId();
//		String genreId = request.getParameter("genreId");

		String menu = request.getParameter("menu");
		String value = request.getParameter("value");
		String commentPhoto = request.getParameter("commentPhoto");
		
		String review = request.getParameter("review");
		String rate = request.getParameter("rate");

	
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		CommentBean comment = new CommentBean();
		comment.setUserId((int)session.getAttribute("userId"));
		comment.setShopId(shopId);
		comment.setGenreId(shopId);
		comment.setReview(review);
		comment.setRate(rate);
		comment.setCommentPhoto(commentPhoto);
		comment.setMenu(menu);
		comment.setValue(value);
		commentList.add(comment);
		
		session.setAttribute("commentList", commentList);
		
		//入力チェック
		if(
		   review == null || review.trim().isEmpty()||
		   rate==null || rate.trim().isEmpty()||
		   commentPhoto==null || commentPhoto.trim().isEmpty()||
		   menu==null || menu.trim().isEmpty()||
		  value==null || value.trim().isEmpty()) {
		 	
			request.setAttribute("errorMessage", "メニュー名・値段・評価・ジャンル・レビューをすべて入力してください");
			RequestDispatcher rd = request.getRequestDispatcher("commentRegist.html");
			rd.forward(request, response);
			return;
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("commentConfirm.jsp");
		rd.forward(request,response);
			
		
	
	}

}
