package boardController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.B_Comment;
import board.BoardService;
import board.BoardVo;

@WebServlet("/boardDEtail")
public class BoardDetailController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		// 에러 확인 코드
		System.out.println(bnum);
		
		// 게시판 글 상세보기
		BoardVo b =  service.boardDetail(bnum);
		
		// 조회수 올리기
		service.save(bnum);
		
		// 게시판 카테고리 보기
		String caName = service.boardCategory(b.getCid());
		
		//게시판 댓글가져 오기
		List<B_Comment> list = service.boardComment(b.getBnum());
		
		req.setAttribute("list", list);
		req.setAttribute("category", caName);
		req.setAttribute("board", b);
		req.getRequestDispatcher("/views/board/boardde.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
