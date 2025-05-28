package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ComentDeleteConfirmServlet
 */
@WebServlet("/coment-delete-confirm-servlet")
public class CommentDeleteConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteConfirmServlet() {
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
		
		int commentId=Integer.parseInt(request.getParameter("commentId"));
		String genreId=request.getParameter("genreId");
		String review=request.getParameter("review");
		String rate=request.getParameter("rate");
		String commentPhoto=request.getParameter("commentPhoto");
		String commentTime=request.getParameter("commentTime");
		String menu=request.getParameter("menu");
		String value=request.getParameter("value");
		
		request.setAttribute("commentId",commentId );
		request.setAttribute("genreId",genreId );
		request.setAttribute("review",review );
		request.setAttribute("rate",rate );
		request.setAttribute("commentPhoto",commentPhoto );
		request.setAttribute("commentTime",commentTime );
		request.setAttribute("menu",menu );
		request.setAttribute("value",value );

		RequestDispatcher rd = request.getRequestDispatcher("commentDeleteConfirm.jsp");
		
		rd.forward(request, response);
	}

}
