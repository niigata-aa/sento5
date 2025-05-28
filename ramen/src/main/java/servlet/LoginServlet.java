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

import model.Bean.UserBean;
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
<<<<<<< HEAD
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userId1 = request.getParameter("userId");
=======
		String userId = request.getParameter("userId");
>>>>>>> branch 'master' of https://github.com/niigata-aa/sento5.git
		String password =request.getParameter("password");
<<<<<<< HEAD
		String url = null;
		//入力チェック

		String message = null;
        if(userId1 == null || password == null){

            //ダイレクトアクセス時のエラー設定

            message = "フォーム画面から入力してね。";

        }else if(userId1.equals("") || password.equals("")){

            //空白の場合のエラー設定

            message = "何も入力されていませんよ。";

        }else{
            try{

                int num1 = Integer.parseInt(userId1);

                int num2 = Integer.parseInt(password);
  
            }catch(NumberFormatException e){

                //文字が入力された場合のエラー設定

                message = "数字を入力してね。";

            }

        }


=======
		
		//入力チェック
		if(userId==null || userId.trim().isEmpty()||
		   password == null || password.trim().isEmpty()) {
			
			request.setAttribute("errorMessage", "ユーザ名とパスワードを入力してください");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
>>>>>>> branch 'master' of https://github.com/niigata-aa/sento5.git
		/**
		 * ログイン処理
		 * パスワードが一致したらuser_idをセッションに設定
		 */
		UserDAO dao = new UserDAO();
		UserBean user = new UserBean();
		int roll=1;
		try {
			//DAOの生成
			if(dao.loginCheck(Integer.parseInt(userId), password)) {
				//セッションにユーザIDをセット
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("userName", user.getUserName());
				//rollが0（管理者)ならセッションにset
				if(dao.rollCheck(Integer.parseInt(userId))==0) {
					session.setAttribute("roll",roll);
				}
				//トップページに遷移
				response.sendRedirect("top.jsp");

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
			e.printStackTrace();
		}

	}

}
