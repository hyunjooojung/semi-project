package board;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import common.PageInfo;

public class BoardDAO {

	public int insert(Connection conn, BoardVo b) {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO bbs VALUES(BNUM.nextval, ? , ? , SYSDATE, ?, ?, 0, DEFAULT)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getCid());
			pstmt.setInt(4, b.getUcode());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateBoard(Connection conn, BoardVo b) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE bbs b SET b.title = ? ,b.content= ?, b.status=? "
					+ "where b.bnum = ?";
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getStatus());			
			pstmt.setInt(4, b.getBnum());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	//전체
	public int getBoardCount(Connection conn, int cid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT  count(*) FROM bbs WHERE cid = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//전체
	public List<BoardVo> getBoardList(Connection conn, int cid, PageInfo pageinfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVo> list = new ArrayList<BoardVo>();

		String sql = "SELECT b.* FROM("
					+ "SELECT ROWNUM AS RNUM, b.*  FROM "
					+ "(SELECT b.*,m.id FROM bbs b "
					+ "JOIN member m ON (b.ucode = m.ucode) "
					+ "where b.cid = ? and b.status = 'Y' "
					+ "order by b.bnum asc "
					+ "    )b "
					+ ")b "
					+ "WHERE rnum BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, pageinfo.getStartList());
			pstmt.setInt(3, pageinfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVo board = new BoardVo();
				board.setRnum(rs.getInt("RNUM"));
				board.setBnum(rs.getInt("BNUM"));
				board.setBdate(rs.getDate("BDATE"));
				board.setCid(rs.getInt("CID"));
				board.setContent(rs.getString("CONTENT"));
				board.setReadcount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				board.setTitle(rs.getString("TITLE"));
				board.setUcode(rs.getInt("UCODE"));
				board.setId(rs.getString("ID"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	//전체(검색했을때)
	public int getBoardCount(Connection conn, int cid, String title) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT  count(*) FROM bbs "
				+ "where cid = ? "
				+ "and title like ?";
		
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setString(2, "%" + title + "%");
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//조건있을때
	public List<BoardVo> getBoardList(Connection conn, int cid, PageInfo pageinfo, String title) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVo> list = new ArrayList<BoardVo>();

		String sql = "SELECT b.* FROM("
				+ "SELECT ROWNUM AS RNUM, b.*  FROM "
				+ "(SELECT b.*,m.id FROM bbs b "
				+ "JOIN member m ON (b.ucode = m.ucode) "
				+ "where b.cid = ? and b.status = 'Y' "
				+ "and title like ? "
				+ "order by b.bnum asc "
				+ "    )b "
				+ ")b "
				+ "WHERE rnum BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setString(2, "%" + title + "%");
			pstmt.setInt(3, pageinfo.getStartList());
			pstmt.setInt(4, pageinfo.getEndList());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo board = new BoardVo();
				board.setRnum(rs.getInt("RNUM"));
				board.setBnum(rs.getInt("BNUM"));
				board.setBdate(rs.getDate("BDATE"));
				board.setCid(rs.getInt("CID"));
				board.setContent(rs.getString("CONTENT"));
				board.setReadcount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				board.setTitle(rs.getString("TITLE"));
				board.setUcode(rs.getInt("UCODE"));
				board.setId(rs.getString("ID"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public BoardVo boardDetail(Connection conn, int bnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.*,m.id  from bbs b "
				+ "JOIN member m on (m.ucode = b.ucode) "
				+ "WHERE bnum = ?";
		BoardVo board = new BoardVo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				board.setBdate(rs.getDate("BDATE"));
				board.setBnum(rs.getInt("BNUM"));
				board.setCid(rs.getInt("CID"));
				board.setContent(rs.getString("CONTENT"));
				board.setId(rs.getString("ID"));
				board.setReadcount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));				
				board.setTitle(rs.getString("TITLE"));
				board.setUcode(rs.getInt("UCODE"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return board;
	}
	
	public String boardCategory(Connection conn, int cid) {
		String str = null;
		String sql = "SELECT cname FROM c_bbs "
					+ "where cid = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				str = rs.getString("CNAME");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return str;
	}
	
	public List<B_Comment> getBoardComment(Connection conn, int bnum) {
		List<B_Comment> list = new ArrayList<B_Comment>();
		String sql = "SELECT b.*, m.id FROM b_comment b "
					+ "JOIN  member m on (m.ucode = b.ucode) "
					+ "WHERE b.status = 'Y' "
					+ "AND bnum = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				B_Comment b_Comment = new B_Comment();
				b_Comment.setBnum(rs.getInt("BNUM"));
				b_Comment.setCdate(rs.getDate("CDATE"));
				b_Comment.setCnum(rs.getInt("CNUM"));
				b_Comment.setContent(rs.getString("CONTENT"));
				b_Comment.setId(rs.getString("ID")); 
				b_Comment.setStatus(rs.getString("STATUS"));
				b_Comment.setUcode(rs.getInt("UCODE"));
				
				list.add(b_Comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public int insertComment(Connection conn,B_Comment b) {
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO B_COMMENT VALUES(CNUM.nextval, ?, sysdate, ?, ?, DEFAULT)";
		int result = 0;
		int cnt = 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(cnt++, b.getContent());
			pstmt.setInt(cnt++, b.getBnum());
			pstmt.setInt(cnt++, b.getUcode());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateCommentBoard(Connection conn, int bnum) {
		PreparedStatement pstmt = null;
		String sql = "UPDATE bbs b SET b.readcount = b.readcount+1 "
				+ "WHERE b.bnum = ?";
		int result = 0;
		int cnt = 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(cnt, bnum);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int DeleteCommentBoard(Connection conn, int cnum) {
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM B_COMMENT c WHERE c.cnum = ?";
		int result = 0;
		int cnt = 1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(cnt, cnum);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

//	public static void main(String[] args) {
//		BoardDAO dao = new BoardDAO();
//		List<BoardVo> list = new ArrayList<BoardVo>();
//		Connection conn = JDBCTemplate.getConnection();
//
//		/*
//		 * int count = dao.getBoardCount(conn, 3); System.out.println(count);
//		 */
//		/*
//		 * PageInfo info = new PageInfo(1, 10, count, 10);
//		 * 
//		 * list = dao.getBoardList(conn, 3, info);
//		 */
//		/*
//		 * for(BoardVo b : list) { System.out.println(b.toString());
//		 * System.out.println(b.getId()); }
//		 * 
//		 * count = dao.getBoardCount(conn, 3, "1"); System.out.println(count);
//		 * 
//		 * list = dao.getBoardList(conn, 3, info, "1"); for(BoardVo b : list) {
//		 * System.out.println(b.toString()); System.out.println(b.getId()); }
//		 */
//		
//		BoardVo b = dao.boardDetail(conn, 1);
//		System.out.println(b.toString());
//		
//		String str = dao.boardCategory(conn, 3);
//		System.out.println(str);
//		
//		
//	}




}
