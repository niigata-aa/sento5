package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bean.ShopBean;
import model.DAO.ShopDAO;

/**
 * Servlet implementation class ShopSearchServlet
 */
@WebServlet("/shop-search-servlet")
public class ShopSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopSearchServlet() {
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
		String shopName = request.getParameter("shopName");
		String area = request.getParameter("area");
		
		//DAOの利用
		ShopDAO shopDAO = new ShopDAO();
		
		List<ShopBean> shopList = new ArrayList<>();
		
		//検索結果の判断
		try {
			if((shopName == null || shopName.isEmpty())&&(area == null || area.isEmpty())) {
				shopList = ShopDAO.selectAllshop();
			}else if((shopName != null || shopName.isEmpty())&&(area == null || area.isEmpty())){
				shopList = ShopDAO.selectShopNameShop(shopName);
			}else if((shopName == null || shopName.isEmpty())&&(area != null || area.isEmpty())){
				shopList = ShopDAO.selectAreaShop(area);
			}
		}catch (SQLException | ClassNotFoundException e){}
		
		
		
		doGet(request, response);
	}

}
