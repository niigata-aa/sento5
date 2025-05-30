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

import model.Bean.GenreBean;
import model.Bean.ShopBean;
import model.DAO.GenreDAO;
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
		String genreIdStr = request.getParameter("genreId");
		
		//空文字をnullに
		if (shopName != null && shopName.trim().isEmpty()) {
			shopName = null;
		}
		if (area != null && area.trim().isEmpty()) {
			area = null;
		}
		
		Integer genreId = null;
        if (genreIdStr != null && !genreIdStr.trim().isEmpty() && !genreIdStr.equals("0")) {
            genreId = Integer.parseInt(genreIdStr);
        }
		
		//DAOの利用
		ShopDAO shopDAO = new ShopDAO();
		GenreDAO genreDAO = new GenreDAO();
		
		List<ShopBean> shopList = new ArrayList<>();
		List<GenreBean> genreList = new ArrayList<>();
		
		
		//検索結果の判断
//		try {
//			if((shopName == null || shopName.isEmpty())&&(area == null || area.isEmpty())) {
//				shopList = ShopDAO.selectAllshop();
//			}else if((shopName != null || shopName.isEmpty())&&(area == null || area.isEmpty())){
//				shopList = ShopDAO.selectShopNameShop(shopName);
//			}else if((shopName == null || shopName.isEmpty())&&(area != null || area.isEmpty())){
//				shopList = ShopDAO.selectAreaShop(area);
//			}else {
//				shopList = ShopDAO.selectShopNameAndAreaShop(shopName, area);
//			}
//			//検索結果をリクエストスコープに保存
//			request.setAttribute("shopList", shopList);
//			request.setAttribute("shopName", shopName);
//			request.setAttribute("area", area);
//			
//		}catch (SQLException | ClassNotFoundException e){
//			e.printStackTrace();
//		}
		
		
		//5/30//////////////////////////////////////////////////////////////////
		try {
	          
			genreList = genreDAO.selectGenre();
			
	           // 検索条件に応じた店舗検索
	           if (shopName == null && area == null && genreId == null) {
	               // 全て未指定：全店舗
	               shopList = ShopDAO.selectAllshop();
	           } else {
	               // 複合検索
	               shopList = shopDAO.selectShopByMultipleConditions(shopName, area, genreId);
	           }
	          
	           // 検索結果をリクエストスコープに保存
	           request.setAttribute("shopList", shopList);
	           request.setAttribute("genreList", genreList);
	           request.setAttribute("searchShopName", shopName);
	           request.setAttribute("searchArea", area);
	           request.setAttribute("searchGenreId", genreId);
	          
	       } catch (SQLException | ClassNotFoundException e) {
	           e.printStackTrace();
	       }

		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/shopSearch.jsp");
        dispatcher.forward(request, response);
	}
	////////////////////////////////////////////////////////////////////////////////////
	
	
	

}
