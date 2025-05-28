package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserRegistConfirmServlet
 */
@WebServlet("/user-regist-confirm-servlet")
public class UserRegistConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistConfirmServlet() {
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
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		//入力チェック
		if(userId==null || userId.trim().isEmpty()||
		   password == null || password.trim().isEmpty()) {
			
			request.setAttribute("errorMessage", "ユーザ名とパスワードを入力してください");
			RequestDispatcher rd = request.getRequestDispatcher("userRegist.jsp");
			rd.forward(request, response);
			return;
		}
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("userName", userName);
		session.setAttribute("password", password);
		
		RequestDispatcher rd = request.getRequestDispatcher("userRegistConfirm.jsp");
		rd.forward(request,response);
			
		
	}

}
