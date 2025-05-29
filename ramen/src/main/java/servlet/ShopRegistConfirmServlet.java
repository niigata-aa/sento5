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
@MultipartConfig(
	    maxFileSize = 10485760,           // 10MB (1ファイルの最大サイズ)
	    maxRequestSize = 52428800,        // 50MB (リクエスト全体の最大サイズ)
	    fileSizeThreshold = 2097152       // 2MB (メモリ上で保持する最大サイズ)
	)
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
		String walkingDistanceStr = request.getParameter("walkDistance");

        // Stringからbooleanへの変換
        boolean walkingDistance = Boolean.parseBoolean(walkingDistanceStr); // "true" なら true, "false" なら false
			
		
		//name属性がimageのファイルをPartオブジェクトとして取得
		Part photo=request.getPart("image");
		//ファイル名を取得
		String filename=Paths.get(photo.getSubmittedFileName()).getFileName().toString();
		//アップロードするフォルダ
		String path=getServletContext().getRealPath("/upload");
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
		shopInfo.setWalkingDistance(walkingDistance);
		
		//セッション
		HttpSession session = request.getSession();
		session.setAttribute("shopInfo", shopInfo);
		
		
		//リクエストの転送
		RequestDispatcher rd = request.getRequestDispatcher("shopRegistConfirm.jsp");
		rd.forward(request, response);
		
	}

}
