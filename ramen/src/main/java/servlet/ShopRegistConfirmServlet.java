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

	// アップロードされたファイルを保存するフォルダ
	//プロジェクト内にフォルダは作成しないでOK
	//サーバーが動くときに、自動的に生成（Tomcatが仮展開する場所に）
	private static final String UPLOAD_DIR = "uploads";
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
			
		
     // 保存ディレクトリのパス（アプリケーションのルートから相対パス）
     		//フォルダの場所を取得
     		String appPath = request.getServletContext().getRealPath("");
     		//↑のuploadsフォルダの場所
     		String savePath = appPath + File.separator + UPLOAD_DIR;

     		// フォルダがなければ作成
     		File uploadDir = new File(savePath);
     		if (!uploadDir.exists())
     			uploadDir.mkdir();

     		// ブラウザから送られてきたファイル（`name="image"`）を受け取る
     		//getSubmittedFileName()：アップロードされたファイルの「元の名前」を取得
     		Part part = request.getPart("image");
     		String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

     		// ファイル保存
     		part.write(savePath + File.separator + filename);

     		//実際に保存されている場所
     		//サーバを再公開した場合はファイルはなくなる可能性あり
     		System.out.println(request.getServletContext().getRealPath(""));
		
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
