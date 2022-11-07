package board;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import common.JDBCTemplate;
import common.PageInfo;

public class BoardService {
	
	private BoardDAO dao = new BoardDAO();
	private Connection conn = JDBCTemplate.getConnection();
	
	
	public int save(BoardVo b) {
		Connection conn = getConnection();
		int result = 0;
		
		if(b.getBnum() != 0) {
			result = dao.updateBoard(conn, b);
		}else {
			result = dao.insert(conn, b);
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public void save(int bnum) {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.updateCommentBoard(conn, bnum);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}
	
	public int saveDelite(int cnum) {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.DeleteCommentBoard(conn, cnum);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);		
		return result;
	}
	
	public int getBoardCount(int cid , String title) {
		Connection conn = getConnection();
		int result = dao.getBoardCount(conn, cid ,title);
		close(conn);
		return result;
	}
	
	public List<BoardVo> getBoardList(PageInfo pageinfo, int cid , String title) {
		Connection conn = getConnection();
		List<BoardVo> list = dao.getBoardList(conn, cid, pageinfo, title);
		close(conn);
		return list;
	}
	
	public int getBoardCount(int cid) {
		Connection conn = getConnection();
		int result = dao.getBoardCount(conn, cid);
		close(conn);
		return result;
	}
	
	public List<BoardVo> getBoardList(PageInfo pageinfo, int cid) {
		Connection conn = getConnection();
		List<BoardVo> list = dao.getBoardList(conn, cid, pageinfo);
		close(conn);
		return list;
	}
	
	public BoardVo boardDetail(int bnum) {
		Connection conn = getConnection();
		BoardVo b = dao.boardDetail(conn, bnum);
		close(conn);
		return b;
	}

	public String boardCategory(int cid) {
		Connection conn = getConnection();
		String str = dao.boardCategory(conn,cid);
		close(conn);
		return str;
	}

	public List<B_Comment> boardComment(int bnum) {
		Connection conn = getConnection();
		List<B_Comment> list = dao.getBoardComment(conn, bnum);
		close(conn);
		return list;
	}

	public int insertComment(B_Comment b) {
		Connection conn = getConnection();
		int result = dao.insertComment(conn, b);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
}
