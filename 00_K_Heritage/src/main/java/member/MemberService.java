package member;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

public class MemberService {

	private MemberDao dao = new MemberDao();

	public MemberVo findMemberById(String id) {
		Connection conn = getConnection();
		MemberVo member = dao.findMemberById(conn, id);
		close(conn);
		return member;
	}

	// 로그인기능, id pw를 DB에서 대조하여 인증된 사용자인지 검증하는 기능
	public MemberVo login(String id, String pw) {
		MemberVo member = findMemberById(id);
//		System.out.println(member.toString());
		// 꼼수 기능, 향후 pw를 hash코드로 대체할건데, pw 변경이 필요함으로 admin 따로 기능구현
		if (member != null && member.getId().equals("admin@naver.com")) {
			return member;
		}

		if (member != null && member.getUPw().equals(pw)) {
			return member;
		} else {
			return null;
		}
	}

	public int save(MemberVo member) {
		int result = 0;
		Connection conn = getConnection();

		if (member.getUCode() != 0) {
			result = dao.updateMember(conn, member);
		} else {
			result = dao.insertMember(conn, member);
		}

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.updateStatus(conn, no, "N");

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 중복 가입 방지용
	public boolean isDuplicated(String id) {
		Connection conn = getConnection();
		MemberVo member = dao.findMemberById(conn, id);
		close(conn);

		if (member != null) {
			return true; // 중복됨
		} else {
			return false; // 중복되지 않음! -> 회원가입 가능
		}
	}
	
	public static void main(String[] args) {
		MemberService service = new MemberService();
		
//		MemberVo vo1 = service.findMemberById("admin@naver.com");
		MemberVo vo = service.login("admin@naver.com", "admin");
		
//		System.out.println(vo1.toString());
		System.out.println(vo);
	}

}
