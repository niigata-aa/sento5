package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Bean.ShopBean;

/**
 * Servlet implementation class ShopEditConfirmServlet
 */
@WebServlet("/shop-edit-confirm")
public class ShopEditConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopEditConfirmServlet() {
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
		
		String shopName = request.getParameter("shopName");
		String shopKana = request.getParameter("shopKana");
		String address = request.getParameter("address");
		String openTime = request.getParameter("openTime");
		String closeTime = request.getParameter("closeTime");
		String closedDay = request.getParameter("closeDay");
		String detail = request.getParameter("detail");

//		if(shopName== null) {
//			shopName=shop.getShopName();
//		}
//		if(shopKana==null) {
//			shopKana=shop.getShopKana();
//		}
//		if(address==null) {
//			address=shop.getAddress();
//		}
//		if(openTime==null) {
//			openTime=shop.getOpenTime();
//		}
//		if(closeTime==null) {
//			closeTime=shop.getCloseTime();
//		}
//		if(closedDay==null) {
//			closedDay=shop.getClosedDay();
//		}
//		if(detail==null) {
//			detail=shop.getDetail();
//		}
 		
		ShopBean editInfo = new ShopBean();
		editInfo.setShopName(shopName);
		editInfo.setShopKana(shopKana);
		editInfo.setAddress(address);
		editInfo.setOpenTime(openTime);
		editInfo.setCloseTime(closeTime);
		editInfo.setClosedDay(closedDay);
		editInfo.setDetail(detail);	
		
		HttpSession session = request.getSession();
		ShopBean shop =(ShopBean)session.getAttribute("shopdetail");
		editInfo.setPhoto(shop.getPhoto());
		session.setAttribute("editInfo", editInfo);
		
			
		RequestDispatcher rd = request.getRequestDispatcher("shopEditConfirm.jsp");
		rd.forward(request, response);
	}

}
