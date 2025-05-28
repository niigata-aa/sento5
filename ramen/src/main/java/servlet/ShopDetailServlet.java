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
import model.DAO.GenreDAO;
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
		int shopId = Integer.parseInt(request.getParameter("shopId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		String genreId = request.getParameter("genreId");
		int roll = 1;//ユーザの値
		//DAOの生成
		ShopDAO shopdao = new ShopDAO();
		UserDAO userdao = new UserDAO();
		GenreDAO genredao = new GenreDAO();
		CommentDAO commentdao = new CommentDAO();
		try {
			//DAOの利用
			List<ShopBean> shopdetail = shopdao.selectShop(shopId);
			String userName = userdao.selectUserName(userId);
			String genreName = genredao.selectGenreName(Integer.parseInt(genreId));
			ArrayList<CommentBean> commentList = (ArrayList<CommentBean>) commentdao.selectComment(shopId);
			//セッションオブジェクトの生成
			HttpSession session = request.getSession();
			//セッションスコープへの属性の設定
			session.setAttribute("shopdetail", shopdetail);
			//管理者だった場合
			if(userdao.rollCheck(roll)==0) {
				//リクエストスコープへの属性の設定
				request.setAttribute("roll", roll);
			}
			//リクエストスコープへの属性の設定
			request.setAttribute("userName", userName);
			request.setAttribute("genreName", genreName);
			request.setAttribute("commentList", commentList);
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("shopDetail.jsp");
		rd.forward(request, response);
	}

}
