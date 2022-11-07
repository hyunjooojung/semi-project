package main;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MainDao {
	
	// 메인페이지 - 오늘의 문화재 가져오는 쿼리문
	public List<MainVO> TodayCultureDi(Connection conn) {
		List<MainVO> list = new ArrayList<MainVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ccbaMnm1, imageUrl FROM " +
					 "(select * from culturaldi " + 
					 "WHERE imageurl is not null " +
					 "order by dbms_random.value) " +
					 "WHERE ROWNUM <= 5";
		
		try {
			pstmt = conn.prepareStatement(sql); // 기본 쿼리 셋팅
			rs = pstmt.executeQuery(); // 실제 DB에 쿼리를 요청하는 코드
			
			while (rs.next()) { // 결과가 있는 경우
				MainVO m = new MainVO();
				m.setCcbaMnm1(rs.getString("ccbaMnm1"));
				m.setImageUrl(rs.getString("imageUrl"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	// 메인페이지 - 인기 박물관 가져오는 쿼리문
	public List<MainVO> PopMusuem(Connection conn) {
		List<MainVO> list = new ArrayList<MainVO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROWNUM, M.* "
				+ "FROM (SELECT MuseumCd,fcltyNm, areadr, weekdayOperOpenHhmm, "
				+ "weekdayOperColseHhmm, holidayOperOpenHhmm, holidayCloseOpenHhmm "
				+ "FROM museum ORDER BY CNT DESC) M "
				+ "WHERE ROWNUM <= 2";
		
		try {
			pstmt = conn.prepareStatement(sql); // 기본 쿼리 셋팅
//			pstmt.setInt(1, MuseumCd);
			rs = pstmt.executeQuery(); // 실제 DB에 쿼리를 요청하는 코드
			
			while (rs.next()) { // 결과가 있는 경우
				MainVO m = new MainVO();
				m.setMuseumCd(rs.getInt("MuseumCd"));
				m.setFcltyNm(rs.getString("fcltyNm"));
				m.setAreadr(rs.getString("areadr"));
				m.setWeekdayOperOpenHhmm(rs.getString("weekdayOperOpenHhmm"));
				m.setWeekdayOperColseHhmm(rs.getString("weekdayOperColseHhmm"));
				m.setHolidayOperOpenHhmm(rs.getString("holidayOperOpenHhmm"));
				m.setHolidayCloseOpenHhmm(rs.getString("holidayCloseOpenHhmm"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	//테스트
	public static void main(String[] args) {
		Connection conn = getConnection();
		MainDao dao = new MainDao();
		
		System.out.println("오늘의 문화재");
		List<MainVO> list1 = dao.TodayCultureDi(conn);
		for (MainVO m : list1) {
			System.out.println(m.toString());
		}
		
		System.out.println("인기 박물관");
		List<MainVO> list2 = dao.PopMusuem(conn);
		for (MainVO m : list2) {
			System.out.println(m.toString());
		}
	}
}

