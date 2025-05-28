package servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class UserListServlet
 */
@WebServlet("/user-list-servlet")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
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
		
		String url = null;
		//セッションオブジェクトの取得
		HttpSession session = request.getSession();
		
		//ログイン確認済みかどうかを確認
		if(session.getAttribute("userId") != null) {
			//認証済み
			try {
				UserDAO userDao = new UserDAO();
				List<UserBean> userList = userDao.selectAll();
				request.setAttribute("userList", userList);
				url = "userList.jsp";
			}catch(Exception e){
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request,response);
			
	}	else {
		//未認証
		url = "Login.jsp";
	}

}
}
