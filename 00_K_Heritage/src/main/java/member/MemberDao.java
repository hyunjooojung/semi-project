package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.JDBCTemplate;

public class MemberDao {

	// 멤버 id로 찾기
	public MemberVo findMemberById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Member WHERE Id=? AND STATUS='Y'";
		
		try {
			pstmt = conn.prepareStatement(query); // 기본 쿼리 셋팅
			pstmt.setString(1, id); // ? 구간을 문자열로 채워주는 코드
			rs = pstmt.executeQuery(); // 실제 DB에 쿼리를 요청하는 코드
			
			int cnt = 1;
			
			if(rs.next()) { // 결과가 있는 경우
				MemberVo m = new MemberVo();
				m.setUCode(rs.getInt(cnt++));
				m.setUName(rs.getString(cnt++)); 
				m.setUTel(rs.getString(cnt++));
				m.setUEmail(rs.getString(cnt++));
				m.setId(rs.getString(cnt++));
				m.setUPw(rs.getString(cnt++));
				m.setGender(rs.getString(cnt++));
				m.setMembershipClass(rs.getString(cnt++));
				m.setStatus(rs.getString(cnt));
				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
		}
		return null;
	}
	
	// 회원가입
	public int insertMember(Connection conn, MemberVo m) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO Member VALUES(UCode.nextval, ?, ?, ?, ?, ?, ?, 1, DEFAULT)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getUName());
			pstmt.setString(2, m.getUTel());
			pstmt.setString(3, m.getUEmail());
			pstmt.setString(4, m.getId());
			pstmt.setString(5, m.getUPw());
			pstmt.setString(6, m.getGender());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	// 회원정보업데이트
	public int updateMember(Connection conn, MemberVo m) {
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET UName = ?,UTel = ?,UEmail = ?,UPw = ?,gender = ? WHERE ucode = ? ";
		int result = 0;
		int cnt = 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(cnt++, m.getUName());
			pstmt.setString(cnt++, m.getUTel());
			pstmt.setString(cnt++, m.getUEmail());
			pstmt.setString(cnt++, m.getUPw());
			pstmt.setString(cnt++, m.getGender());
			pstmt.setInt(cnt++, m.getUCode());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	// 탈퇴하기
	public int updateStatus(Connection conn, int no, String status) {
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET STATUS=? WHERE UCode=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status); // Y,N (STATUS IN ('Y', 'N'))
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		Connection conn = JDBCTemplate.getConnection();
		
		MemberVo m = dao.findMemberById(conn, "admin@naver.com");
		System.out.println(m.toString());	
	}
}
