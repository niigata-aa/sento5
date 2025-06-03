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
import javax.servlet.http.HttpSession;

import model.Bean.CommentBean;
import model.DAO.CommentDAO;
import model.DAO.ShopDAO;

/**
 * Servlet implementation class ComentDeleteServlet
 */
@WebServlet("/coment-delete-servlet")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
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
		
		HttpSession session=request.getSession();
		int commentId=(int)session.getAttribute("commentId");
		
		CommentDAO dao=new CommentDAO();
		
		int count;
		ShopDAO shopDao=new ShopDAO();
		List<String> shopNames = new ArrayList<>(); 
		
		try {
			count=dao.deleteComment(commentId);
			
		}catch  (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		List<CommentBean> commentList=null;
		String userId=(String) session.getAttribute("userId");
		
		CommentDAO commentdao=new CommentDAO();
		try {
			
			commentList=commentdao.selectUserComment(Integer.parseInt(userId));
			for (CommentBean comment : commentList) {
	            String shopName = shopDao.selectShopName(comment.getShopId());
	            shopNames.add(shopName); // 取得したユーザー名をリストに追加
	        }
		}catch (SQLException  |  ClassNotFoundException e) {
			e.printStackTrace();
		}
		session.setAttribute("commentList", commentList);
		request.setAttribute("shopNames", shopNames);
		RequestDispatcher rd = request.getRequestDispatcher("comment.jsp");
		
		rd.forward(request, response);
		
	}

}
