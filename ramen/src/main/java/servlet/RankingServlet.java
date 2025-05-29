package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Bean.ShopBean;
import model.DAO.ShopDAO;

/**
 * Servlet implementation class RankingServlet
 */
@WebServlet("/ranking-servlet")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingServlet() {
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
		String url = "ranking.jsp";
		
		int shopId = Integer.parseInt(request.getParameter("shopid"));
		
		//セッションオブジェクトの取得
				HttpSession session = request.getSession();
				
		//ログイン確認済みかどうかを確認
		if(session.getAttribute("userId") != null) {
		
		try {
			
			
			//DAOの生成
			ShopDAO shopdao = new ShopDAO();
			//DAOの利用
			List<ShopBean> shoprankList = shopdao.shopRank(shopId);
			request.setAttribute("shoprankList", shoprankList);
			
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);

		
				}
	}

}
