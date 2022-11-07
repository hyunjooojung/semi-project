package boardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;

@WebServlet("/boarddDelete")
public class BoardCommentDeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cnum = Integer.parseInt(req.getParameter("cnum"));
		
		int result = service.saveDelite(cnum);
		
		if(result > 0) {
			resp.sendRedirect(req.getContextPath() + "/boardDEtail?bnum=" + Integer.parseInt(req.getParameter("bnum")));
		} else {
			resp.sendRedirect(req.getContextPath() + "/boardDEtail?bnum=" + Integer.parseInt(req.getParameter("bnum")));
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
