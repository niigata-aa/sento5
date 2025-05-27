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

import model.DAO.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		request.setCharacterEncoding("UTF-8");
		//リクエストパラメーターの取得
		String userIdStr = request.getParameter("userId");
		String password =request.getParameter("password");
		String url = null;

		/**
		 * ログイン処理
		 * パスワードが一致したらuser_idをセッションに設定
		 */
		UserDAO dao = new UserDAO();
		int roll=1;
		try {
			int userId = Integer.parseInt(userIdStr);
			if(userIdStr!=null && dao.loginCheck(userId, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				if(dao.rollCheck(userId)==0) {
					session.setAttribute("roll",roll);
				}
				url="top.jsp";
			}else {
				url="login-failure.html";
			}
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
