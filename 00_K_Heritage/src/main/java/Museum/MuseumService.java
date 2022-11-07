package Museum;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import common.PageInfo;

public class MuseumService {
	private MuseumDao dao = new MuseumDao();
	private Connection conn = null;

	public MuseumService() {
		conn = getConnection();
	}

	// 박물관 추가
	public int insert(Museum museum) {
		int result = dao.insert(conn, museum);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		// JDBCTemplate.close(conn);
		return result;
	}
	
	// 전체 박물관 갯수
	public int findNameCount() {
		Connection conn = getConnection();
		int result = dao.getMuseumCount(conn);
		close(conn);
		return result;
	}
	public int getMuseumCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getMuseumCount(conn, searchMap);
		close(conn);
		return result;
	}

	// 명칭, 지역별, 인기순 리스트
	public List<Museum> getMuseumlist(PageInfo pageInfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<Museum> list = dao.findAll(conn,pageInfo,searchMap);
		close(conn);
		return list;
	}

	// 박물관 조회수 올려주는 쿼리
	public Museum updateCount(int num, boolean hasRead) {

		Connection conn = getConnection();
		Museum museum = dao.MuseumAll(conn, num);

		if (hasRead == true && museum != null) {
			int result = dao.updateReadCount(conn, museum);
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		return museum;
	}

	public Museum findMuseumByNo(int museumNo, boolean hasRead) {
		Connection conn = getConnection();
		Museum museum = dao.findMuseumByNo(conn, museumNo);

		if (hasRead == true && museum != null) {
			int result = dao.updateReadCount(conn, museum);
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		return museum;
	}

}