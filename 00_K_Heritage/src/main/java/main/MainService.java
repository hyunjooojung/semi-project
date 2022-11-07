package main;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

public class MainService {
	
	private MainDao dao = new MainDao();
	private Connection conn = null;
	
	public MainService() {
		conn = getConnection();
	}
	
	// 오늘의 문화재
	public List<MainVO> TodayCultureDi() {
		Connection conn = getConnection();
		List<MainVO> list = dao.TodayCultureDi(conn);
		close(conn);
		return list;
	}
	
	// 인기 박물관
	public List<MainVO> PopMusuem() {
		Connection conn = getConnection();
		List<MainVO> list = dao.PopMusuem(conn);
		close(conn);
		return list;
	}

	
}
