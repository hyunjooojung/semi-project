package boardController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;

@WebServlet("/boarddelete")
public class BoardDelite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget 실행");

		int bnum = Integer.parseInt(req.getParameter("bnum"));
		BoardVo b = new BoardVo();
		
		b = service.boardDetail(bnum);
		b.setStatus("N");
		
		int result = service.save(b);
		
		if(result > 0) {
			req.setAttribute("msg", "글 삭제 성공했습니다.");
			req.setAttribute("location", "/boardlist?cid="+b.getCid());
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		} else {
			req.setAttribute("msg", "글 삭제 실패했습니다.");
			req.setAttribute("location", "/boardlist?cid="+b.getCid());
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
