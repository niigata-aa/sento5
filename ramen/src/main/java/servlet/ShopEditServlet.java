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

import model.Bean.ShopBean;
import model.DAO.ShopDAO;

/**
 * Servlet implementation class ShopEditServlet
 */
@WebServlet("/shop-edit")
public class ShopEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopEditServlet() {
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
		//セッションオブジェクトの取得
		HttpSession session = request.getSession();
		
		//セッションスコープから属性値の取得
		ShopBean shopUpdate = (ShopBean) session.getAttribute("shopUpdate");
		
		//DAOの生成
		ShopDAO shopDAO = new ShopDAO();
		
		int count = 0;
		
		try {
			//DAOの利用
			count = shopDAO.updateShop(shopUpdate);
		}catch (SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("shopEdit.jsp");
		rd.forward(request, response);
	}

}
