package boardController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;

@WebServlet("/boardUpdate.do")
public class BoardUpdateDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static BoardService service = new BoardService();
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget실행");
		
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		System.out.println(bnum);
		
		BoardVo b = service.boardDetail(bnum);
		
		req.setAttribute("board", b);
		req.getRequestDispatcher("/views/board/board_UpDate.jsp").forward(req, resp);
	}
		
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("dopost실행");
		
	}	
}
