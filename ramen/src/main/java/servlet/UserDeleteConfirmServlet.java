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
 * Servlet implementation class UserDeleteConfirmServlet
 */
@WebServlet("/user-delete-confirm-servlet")
public class UserDeleteConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteConfirmServlet() {
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
		String d_userId = request.getParameter("userId");
		String d_userName = request.getParameter("userName");

		//リクエストスコープの設定
		HttpSession session = request.getSession();
		session.setAttribute("d_userId", d_userId);
		session.setAttribute("d_userName", d_userName);

		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("userDeleteConfirm.jsp");
		rd.forward(request, response);
	}

}
