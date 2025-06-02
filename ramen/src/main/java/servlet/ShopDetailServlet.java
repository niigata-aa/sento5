package servlet;

import java.io.IOException;
import java.sql.SQLException;
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
import model.DAO.CommentDAO;
import model.DAO.ShopDAO;
import model.DAO.UserDAO;

/**
 * Servlet implementation class ShopDetailServlet
 */
@WebServlet("/shop-detail")
public class ShopDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopDetailServlet() {
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
		HttpSession session = request.getSession();
		
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		String userId = (String) session.getAttribute("userId");
		if(userId==null) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		//DAOの生成
		ShopDAO shopdao = new ShopDAO();
		
		CommentDAO commentdao = new CommentDAO();
		UserDAO userDao=new UserDAO();
		
		List<String> userNames = new ArrayList<>(); 
		
		
		try {
			//DAOの利用
			ShopBean shopdetail = shopdao.selectShop(shopId);
			List<CommentBean> commentList = commentdao.selectComment(shopId);
			
			
			for (CommentBean comment : commentList) {
	            String userName = userDao.selectUserName(comment.getUserId());
	            userNames.add(userName); // 取得したユーザー名をリストに追加
	        }
			
			//セッションスコープへの属性の設定
			session.setAttribute("shopdetail", shopdetail);
			request.setAttribute("userNames", userNames);
			//リクエストスコープへの属性の設定
			request.setAttribute("commentList", commentList);
			
	
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("shopDetail.jsp");
		rd.forward(request, response);
	}

}
