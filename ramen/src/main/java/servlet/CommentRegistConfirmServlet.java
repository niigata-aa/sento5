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

import model.Bean.CommentBean;
import model.Bean.ShopBean;

/**
 * Servlet implementation class ComentRegistConfirmServlet
 */
@WebServlet("/comment-regist-confirm-servlet")
@MultipartConfig
public class CommentRegistConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentRegistConfirmServlet() {
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
	private static final String UPLOAD_DIR = "upload";
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		 // 保存ディレクトリのパス（アプリケーションのルートから相対パス）
 		//フォルダの場所を取得
 		String appPath = request.getServletContext().getRealPath("");
 		//↑のuploadフォルダの場所
 		String savePath = appPath + File.separator + UPLOAD_DIR;

 		// フォルダがなければ作成
 		File uploadDir = new File(savePath);
 		if (!uploadDir.exists())
 			uploadDir.mkdir();

 		// ブラウザから送られてきたファイル（`name="image"`）を受け取る
 		//getSubmittedFileName()：アップロードされたファイルの「元の名前」を取得
 		Part part = request.getPart("commentPhoto");
 		String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

 		// ファイル保存
 		part.write(savePath + File.separator + filename);

 		//実際に保存されている場所
 		//サーバを再公開した場合はファイルはなくなる可能性あり
 		System.out.println(request.getServletContext().getRealPath(""));
 		
		HttpSession session = request.getSession();
		ShopBean shop = (ShopBean) session.getAttribute("shop");
		
		//リクエストパラメータの取得
		int shopId = (int)shop.getShopId();
		String genreId = request.getParameter("genreId");

		String menu = request.getParameter("menu");
		String value = request.getParameter("value");
		String review = request.getParameter("review");
		String rate = request.getParameter("rate");

	
		CommentBean comment = new CommentBean();
		comment.setUserId((int)session.getAttribute("userId"));
		comment.setShopId(shopId);
		comment.setGenreId(Integer.parseInt(genreId));
		comment.setGenreId(shopId);
		comment.setReview(review);
		comment.setRate(rate);
		comment.setCommentPhoto(filename);
		comment.setMenu(menu);
		comment.setValue(value);
		
		session.setAttribute("comment", comment);
		
		//入力チェック
		if(
		   review == null || review.trim().isEmpty()||
		   rate==null || rate.trim().isEmpty()||
		   filename==null || filename.trim().isEmpty()||
		   menu==null || menu.trim().isEmpty()||
		  value==null || value.trim().isEmpty()) {
		 	
			request.setAttribute("errorMessage", "メニュー名・値段・評価・ジャンル・レビューをすべて入力してください");
			RequestDispatcher rd = request.getRequestDispatcher("commentRegist.jsp");
			rd.forward(request, response);
			return;
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("commentConfirm.jsp");
		rd.forward(request,response);
			
		
	
	}

}
