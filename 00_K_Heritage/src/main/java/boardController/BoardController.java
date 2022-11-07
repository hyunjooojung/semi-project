package boardController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;
import common.PageInfo;

@WebServlet("/boardlist")
public class BoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget");
		int page = 1;
		int boardCount = 0;
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		System.out.println("cid = " + cid);
		
		PageInfo pageInfo = null;
		List<BoardVo> list = null;
		String searchValue = null;
		
		try {
			searchValue = req.getParameter("searchValue");
			System.out.println(searchValue);
			
			if(req.getParameter("page") != null && req.getParameter("page").length() > 0) {
				page = Integer.parseInt(req.getParameter("page"));
			}
			System.out.println(page);

			boardCount = service.getBoardCount(cid,searchValue);
			pageInfo = new PageInfo(page, 3, boardCount, 10);
			list = service.getBoardList(pageInfo, cid, searchValue);
			
		} catch (Exception e) {}
		
		if(searchValue == null || searchValue.equals(null)) {
			boardCount = service.getBoardCount(cid);
			pageInfo = new PageInfo(page, 3, boardCount, 10);
			list = service.getBoardList(pageInfo, cid);
		}
		
		System.out.println(boardCount);
		System.out.println(list.size());
		
		req.setAttribute("cid", cid);
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/board/board.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
