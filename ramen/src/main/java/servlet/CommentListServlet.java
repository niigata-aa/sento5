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

/**
 * Servlet implementation class ComentListServlet
 */
@WebServlet("/coment-list-servlet")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentListServlet() {
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
		
		List<CommentBean> commentList=null;
		List<String> shopnameList = new ArrayList<>(); 
		
		HttpSession session=request.getSession();
		String userId=(String) session.getAttribute("userId");
		
		CommentDAO dao=new CommentDAO();
		try {
			
			commentList=dao.selectUserComment(Integer.parseInt(userId));
		}catch (SQLException  |  ClassNotFoundException e) {
			e.printStackTrace();
		}
		for(CommentBean comment:commentList){
			shopnameList.add("ShopDAO.selectShopName(comment.getShopId())") ;
		}
		session.setAttribute("commentList", commentList);
		request.setAttribute("shopnameList", shopnameList);
		
		RequestDispatcher rd = request.getRequestDispatcher("comment.jsp");
		
		rd.forward(request, response);
		
	}

}
