package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Bean.ShopBean;

/**
 * Servlet implementation class ShopRegistConfirmServlet
 */
@WebServlet("/shop-regist-confirm-servlet")
@MultipartConfig
public class ShopRegistConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopRegistConfirmServlet() {
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
		String shopName = request.getParameter("shopName");
		String shopKana = request.getParameter("shopKana");
		String address = request.getParameter("address");
		String openTime = request.getParameter("openTime");
		String closeTime = request.getParameter("closeTime");
		String closedDay = request.getParameter("closedDay");
		String detail = request.getParameter("detail");
			
		
		//name属性がpictのファイルをPartオブジェクトとして取得
		Part photo=request.getPart("image");
		//ファイル名を取得
		//String filename=part.getSubmittedFileName();//ie対応が不要な場合
		String filename=Paths.get(photo.getSubmittedFileName()).getFileName().toString();
		//アップロードするフォルダ
		String path=getServletContext().getRealPath("/upload");
		//実際にファイルが保存されるパス確認
		System.out.println(path);
		//書き込み
		photo.write(path+File.separator+filename);

		
		ShopBean shopInfo = new ShopBean();
		shopInfo.setShopName(shopName);
		shopInfo.setShopKana(shopKana);
		shopInfo.setAddress(address);
		shopInfo.setOpenTime(openTime);
		shopInfo.setCloseTime(closeTime);
		shopInfo.setClosedDay(closedDay);
		shopInfo.setDetail(detail);	
		shopInfo.setPhoto(filename);
		
		//セッションの取得・設定
		HttpSession session = request.getSession();
		session.setAttribute("shopInfo", shopInfo);
		
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("shopRegistConfirm.jsp");
		rd.forward(request, response);
		
	}

}
