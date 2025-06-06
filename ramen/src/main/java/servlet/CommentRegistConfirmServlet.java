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

	private static final String UPLOAD_DIR = "upload";
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
 		//フォルダの場所を取得
 		String appPath = request.getServletContext().getRealPath("");
 		String savePath = appPath + File.separator + UPLOAD_DIR;

 		// フォルダがなければ作成
 		File uploadDir = new File(savePath);
 		if (!uploadDir.exists())
 			uploadDir.mkdir();


 		Part part = request.getPart("commentphoto");
 		String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

 		// ファイル保存
 		part.write(savePath + File.separator + filename);

 		//実際に保存されている場所
 		System.out.println(request.getServletContext().getRealPath(""));
 		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		
		//リクエストパラメータの取得
		String shopId =request.getParameter("shopId");
		String genreId = request.getParameter("genreId");
		String menu = request.getParameter("menu");
		String value = request.getParameter("value");
		String review = request.getParameter("review");
		String rate = request.getParameter("rate");

	
		CommentBean comment = new CommentBean();
		comment.setUserId(Integer.parseInt(userId));
		comment.setShopId(Integer.parseInt(shopId));
		comment.setGenreId(Integer.parseInt(genreId));
		comment.setReview(review);
		comment.setRate(rate);
		comment.setCommentPhoto(filename);
		comment.setMenu(menu);
		comment.setValue(value);
		
		session.setAttribute("comment", comment);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("commentConfirm.jsp");
		rd.forward(request,response);
			
		
	
	}

}
