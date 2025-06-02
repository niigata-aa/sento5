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

import model.Bean.ShopBean;
import model.DAO.RankingDAO;

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
		request.setCharacterEncoding("UTF-8");
		String url = "top.jsp";
						
		try {
			//DAOの生成
			RankingDAO rankdao = new RankingDAO();
			//DAOの利用
			List<ShopBean> shoprankList = rankdao.shopRank();
			request.setAttribute("shoprankList", shoprankList);
			
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
				
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		String url = "top.jsp";
						
		try {
			//DAOの生成
			RankingDAO rankdao = new RankingDAO();
			//DAOの利用
			List<ShopBean> shoprankList = rankdao.shopRank();
			request.setAttribute("shoprankList", shoprankList);
			
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
				
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request,response);

		
	}

}
