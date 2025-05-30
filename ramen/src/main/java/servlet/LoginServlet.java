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
		String userId = request.getParameter("userId");
		String password =request.getParameter("password");
		//入力チェック
		if(userId==null || userId.trim().isEmpty()||
		   password == null || password.trim().isEmpty()) {
			
			request.setAttribute("errorMessage", "ユーザ名とパスワードを入力してください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
		/**
		 * ログイン処理
		 * パスワードが一致したらuser_idをセッションに設定
		 */
		UserDAO dao = new UserDAO();
		int roll=1;
		String userName = null;
	
		try {
			//DAOの生成
			if(dao.loginCheck(Integer.parseInt(userId), password)) {
				userName=dao.selectUserName(Integer.parseInt(userId));
				//セッションにユーザIDとユーザ名をセット
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("userName", userName);
				//rollが0（管理者)ならセッションにset
				 roll=dao.rollCheck(Integer.parseInt(userId));
				if(roll==0) {
					session.setAttribute("roll", 0);
					RequestDispatcher rd = request.getRequestDispatcher("admini.jsp");
					rd.forward(request, response);
				}else {
				//トップページに遷移
				session.setAttribute("roll", 1);
//				response.sendRedirect("top.jsp");
				
//				5/30齊藤調整
		        RequestDispatcher rd = request.getRequestDispatcher("/ranking-servlet");
		        rd.forward(request, response);
				}

			}else {//ログイン失敗
				request.setAttribute("errorMessage", "ユーザ名またはパスワードが間違えています。");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (NumberFormatException|NullPointerException e) {
			request.setAttribute("errorMessage", "5桁の社員番号を入力してください。");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			e.printStackTrace();
		}

	}

}
