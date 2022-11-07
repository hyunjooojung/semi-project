package boardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.B_Comment;
import board.BoardService;

@WebServlet("/commentWrite")
public class BoardCommentWrireController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		B_Comment b = new B_Comment();
		b.setContent(req.getParameter("comment"));
		b.setUcode(Integer.parseInt(req.getParameter("ucode")));
		b.setBnum(Integer.parseInt(req.getParameter("bnum")));
		
		int result = service.insertComment(b);
		
		if(result > 0) {
			resp.sendRedirect(req.getContextPath() + "/boardDEtail?bnum=" + Integer.parseInt(req.getParameter("bnum")));
		} else {
			resp.sendRedirect(req.getContextPath() + "/boardDEtail?bnum=" + Integer.parseInt(req.getParameter("bnum")));
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
