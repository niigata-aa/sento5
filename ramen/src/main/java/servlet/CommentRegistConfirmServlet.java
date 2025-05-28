package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComentRegistConfirmServlet
 */
@WebServlet("/coment-regist-confirm-servlet")
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
		//リクエストパラメータの取得
		String userId = request.getParameter("userId");
		String shopId = request.getParameter("shopId");
		String genreId = request.getParameter("genreId");
		String review = request.getParameter("review");
		String rate = request.getParameter("rate");
		String commentPhoto = request.getParameter("commentPhoto");
		String commentTime = request.getParameter("commentTime");
		String menu = request.getParameter("menu");
		String value = request.getParameter("value");
		
		//入力チェック
		if(genreId==null || genreId.trim().isEmpty()||
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
		
		request.setAttribute("userId", userId);
		request.setAttribute("shopId", shopId);
		request.setAttribute("genreId", genreId);
		request.setAttribute("review",review );
		request.setAttribute("rate",rate );
		request.setAttribute("commentPhoto",commentPhoto );
		request.setAttribute("commentTime", commentTime );
		request.setAttribute("menu", menu );
		request.setAttribute("value",value);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("commentRegistConfirm.jsp");
		rd.forward(request,response);
			
		
	
	}

}
