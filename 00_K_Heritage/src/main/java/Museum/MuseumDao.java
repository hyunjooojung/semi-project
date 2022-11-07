package Museum;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.JDBCTemplate;
import common.PageInfo;

public class MuseumDao {

	// 박물관 추가
	public int insert(Connection conn, Museum museum) {
		try {
			String sql = "INSERT INTO Museum(MuseumCd, fcltyNm, areadr, rdnmadr, latitude, "
					+ "longitude, operPhoneNumber, operInstitutionNm, "
					+ "homepageUrl, fcltyInfo, weekdayOperOpenHhmm, weekdayOperColseHhmm, holidayOperOpenHhmm, "
					+ "holidayCloseOpenHhmm, rstdeInfo, adultChrge, yngbgsChrge, "
					+ "childChrge, etcChrgeInfo, fcltyIntrcn, trnsportInfo, phoneNumber, institutionNm, cnt) "
					+ "VALUES(MuseumCd.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			int cnt = 1;
			pstmt.setString(cnt++, museum.getFcltyNm());
			pstmt.setString(cnt++, museum.getAreadr());
			pstmt.setString(cnt++, museum.getRdnmadr());
			pstmt.setString(cnt++, museum.getLatitude());
			pstmt.setString(cnt++, museum.getLongitude());
			pstmt.setString(cnt++, museum.getOperPhoneNumber());
			pstmt.setString(cnt++, museum.getOperInstitutionNm());
			pstmt.setString(cnt++, museum.getHomepageUrl());
			pstmt.setString(cnt++, museum.getFcltyInfo());
			pstmt.setString(cnt++, museum.getWeekdayOperOpenHhmm());
			pstmt.setString(cnt++, museum.getWeekdayOperColseHhmm());
			pstmt.setString(cnt++, museum.getHolidayOperOpenHhmm());
			pstmt.setString(cnt++, museum.getHolidayCloseOpenHhmm());
			pstmt.setString(cnt++, museum.getRstdeInfo());
			pstmt.setString(cnt++, museum.getAdultChrge());
			pstmt.setString(cnt++, museum.getYngbgsChrge());
			pstmt.setString(cnt++, museum.getChildChrge());
			pstmt.setString(cnt++, museum.getEtcChrgeInfo());
			pstmt.setString(cnt++, museum.getFcltyIntrcn());
			pstmt.setString(cnt++, museum.getTrnsportInfo());
			pstmt.setString(cnt++, museum.getPhoneNumber());
			pstmt.setString(cnt++, museum.getInstitutionNm());
			pstmt.setInt(cnt++, museum.getCnt());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 전체 박물관 리스트
	public List<Museum> findAll(Connection conn, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Museum> list = new ArrayList<Museum>();
		String query = "SELECT ROWNUM, m.* FROM " +  
					   "(SELECT  ROWNUM AS RNUM, m.* FROM " + 
					   "(select m.* from museum m order by cnt asc)m)m " + 
					   "WHERE RNUM BETWEEN ? AND ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Museum museum = new Museum();
				museum.setMuseumCd(rs.getInt("MuseumCd"));
				museum.setFcltyNm(rs.getString("fcltyNm"));
				museum.setAreadr(rs.getString("areadr"));
				museum.setRdnmadr(rs.getString("rdnmadr"));
				museum.setLatitude(rs.getString("latitude"));
				museum.setLongitude(rs.getString("longitude"));
				museum.setOperPhoneNumber(rs.getString("operPhoneNumber"));
				museum.setOperInstitutionNm(rs.getString("operInstitutionNm"));
				museum.setHomepageUrl(rs.getString("homepageUrl"));
				museum.setFcltyInfo(rs.getString("fcltyInfo"));
				museum.setWeekdayOperOpenHhmm(rs.getString("weekdayOperOpenHhmm"));
				museum.setWeekdayOperColseHhmm(rs.getString("weekdayOperColseHhmm"));
				museum.setHolidayOperOpenHhmm(rs.getString("holidayOperOpenHhmm"));
				museum.setHolidayCloseOpenHhmm(rs.getString("holidayCloseOpenHhmm"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setAdultChrge(rs.getString("adultChrge"));
				museum.setYngbgsChrge(rs.getString("yngbgsChrge"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setChildChrge(rs.getString("childChrge"));
				museum.setEtcChrgeInfo(rs.getString("etcChrgeInfo"));
				museum.setFcltyIntrcn(rs.getString("fcltyIntrcn"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setTrnsportInfo(rs.getString("trnsportInfo"));
				museum.setPhoneNumber(rs.getString("phoneNumber"));
				museum.setInstitutionNm(rs.getString("institutionNm"));
				museum.setCnt(rs.getInt("cnt"));

				list.add(museum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 전체 박물관 갯수
	public int getMuseumCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM museum ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 명칭, 지역별, 인기순 검색- 검색페이지 조건이 있을때 리스트
	public List<Museum> findAll(Connection conn,PageInfo pageInfo,Map<String, String> searchMap) {
		List<Museum> list = new ArrayList<Museum>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sqlBefore = "SELECT m.* FROM "
						+ "(SELECT ROWNUM AS RNUM, m.* FROM "
						+ "(SELECT m.* from museum m "
						+ "where 1 = 1 ";

		String sqlAfter =  ")m " + ")m " + "where RNUM BETWEEN ? AND ?";
		
		if (searchMap.containsKey("name")) {
			sqlBefore += "AND fcltynm LIKE ? ";
		}

		if (searchMap.containsKey("area")) {
			sqlBefore += "AND areadr LIKE ? ";
		}

		if (searchMap.containsKey("sort")) {
			sqlBefore += "ORDER BY cnt ";

			if (searchMap.containsValue("내림차순")) {
				sqlBefore += "DESC ";
			} else {
				sqlBefore += "ASC ";
			}
		}

		String sql = sqlBefore + sqlAfter;

		try {
			pstmt = conn.prepareStatement(sql);
			int count = 1;

			if (searchMap.containsKey("name")) {
				pstmt.setString(count++, "%" + searchMap.get("name") + "%");
			}

			if (searchMap.containsKey("area")) {
				pstmt.setString(count++, searchMap.get("area"));
			}
			
			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());

			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				Museum museum = new Museum();
				museum.setMuseumCd(rs.getInt("MuseumCd"));
				museum.setFcltyNm(rs.getString("fcltyNm"));
				museum.setAreadr(rs.getString("areadr"));
				museum.setRdnmadr(rs.getString("rdnmadr"));
				museum.setLatitude(rs.getString("latitude"));
				museum.setLongitude(rs.getString("longitude"));
				museum.setOperPhoneNumber(rs.getString("operPhoneNumber"));
				museum.setOperInstitutionNm(rs.getString("operInstitutionNm"));
				museum.setHomepageUrl(rs.getString("homepageUrl"));
				museum.setFcltyInfo(rs.getString("fcltyInfo"));
				museum.setWeekdayOperOpenHhmm(rs.getString("weekdayOperOpenHhmm"));
				museum.setWeekdayOperColseHhmm(rs.getString("weekdayOperColseHhmm"));
				museum.setHolidayOperOpenHhmm(rs.getString("holidayOperOpenHhmm"));
				museum.setHolidayCloseOpenHhmm(rs.getString("holidayCloseOpenHhmm"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setAdultChrge(rs.getString("adultChrge"));
				museum.setYngbgsChrge(rs.getString("yngbgsChrge"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setChildChrge(rs.getString("childChrge"));
				museum.setEtcChrgeInfo(rs.getString("etcChrgeInfo"));
				museum.setFcltyIntrcn(rs.getString("fcltyIntrcn"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setTrnsportInfo(rs.getString("trnsportInfo"));
				museum.setPhoneNumber(rs.getString("phoneNumber"));
				museum.setInstitutionNm(rs.getString("institutionNm"));
				museum.setCnt(rs.getInt("cnt"));

				list.add(museum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 명칭, 지역별, 인기순 갯수 - 검색페이지 동적쿼리
	public int getMuseumCount(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) FROM museum WHERE 1 = 1 ";

		if (searchMap.containsKey("name")) {
			sql += "AND fcltynm LIKE ? ";
		}

		if (searchMap.containsKey("area")) {
			sql += "AND areadr LIKE ? ";
		}

		if (searchMap.containsKey("sort")) {
			sql += "ORDER BY cnt ";

			if (searchMap.containsValue("내림차순")) {
				sql += "DESC ";
			} else {
				sql += "ASC ";
			}
		}

		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			int count = 1;

			if (searchMap.containsKey("name")) {
				pstmt.setString(count++, "%" + searchMap.get("name") + "%");
			}

			if (searchMap.containsKey("area")) {
				pstmt.setString(count++, searchMap.get("area"));
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 박물관 세부 정보 - 박물관 상세페이지
	public Museum MuseumAll(Connection conn, int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Museum museum = null;

		String sql = "select * FROM Museum where MuseumCd LIKE ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				museum = new Museum();
				museum.setMuseumCd(rs.getInt("MuseumCd"));
				museum.setFcltyNm(rs.getString("fcltyNm"));
				museum.setAreadr(rs.getString("Areadr"));
				museum.setRdnmadr(rs.getString("rdnmadr"));
				museum.setLatitude(rs.getString("latitude"));
				museum.setLongitude(rs.getString("longitude"));
				museum.setOperPhoneNumber(rs.getString("operPhoneNumber"));
				museum.setOperInstitutionNm(rs.getString("operInstitutionNm"));
				museum.setHomepageUrl(rs.getString("homepageUrl"));
				museum.setFcltyInfo(rs.getString("fcltyInfo"));
				museum.setWeekdayOperOpenHhmm(rs.getString("weekdayOperOpenHhmm"));
				museum.setWeekdayOperColseHhmm(rs.getString("weekdayOperColseHhmm"));
				museum.setHolidayOperOpenHhmm(rs.getString("holidayOperOpenHhmm"));
				museum.setHolidayCloseOpenHhmm(rs.getString("holidayCloseOpenHhmm"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setAdultChrge(rs.getString("adultChrge"));
				museum.setYngbgsChrge(rs.getString("yngbgsChrge"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setChildChrge(rs.getString("childChrge"));
				museum.setEtcChrgeInfo(rs.getString("etcChrgeInfo"));
				museum.setFcltyIntrcn(rs.getString("fcltyIntrcn"));
				museum.setRstdeInfo(rs.getString("rstdeInfo"));
				museum.setTrnsportInfo(rs.getString("trnsportInfo"));
				museum.setPhoneNumber(rs.getString("phoneNumber"));
				museum.setInstitutionNm(rs.getString("institutionNm"));
				museum.setInstitutionNm(rs.getString("institutionNm"));
				museum.setCnt(rs.getInt("cnt"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return museum;
	}

	// 박물관 조회수 올려주는 쿼리
	public int updateReadCount(Connection conn, Museum museum) {
		PreparedStatement pstmt = null;
		String query = "UPDATE museum SET cnt = cnt + 1 WHERE MuseumCd = ? ";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, museum.getMuseumCd());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 박물관 세부 정보 - 박물관 상세페이지
		public Museum findMuseumByNo(Connection conn, int num) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Museum museum = null;

			String sql = "select * FROM Museum where MuseumCd = ?";

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					museum = new Museum();
					museum.setMuseumCd(rs.getInt("MuseumCd"));
					museum.setFcltyNm(rs.getString("fcltyNm"));
					museum.setAreadr(rs.getString("Areadr"));
					museum.setRdnmadr(rs.getString("rdnmadr"));
					museum.setLatitude(rs.getString("latitude"));
					museum.setLongitude(rs.getString("longitude"));
					museum.setOperPhoneNumber(rs.getString("operPhoneNumber"));
					museum.setOperInstitutionNm(rs.getString("operInstitutionNm"));
					museum.setHomepageUrl(rs.getString("homepageUrl"));
					museum.setFcltyInfo(rs.getString("fcltyInfo"));
					museum.setWeekdayOperOpenHhmm(rs.getString("weekdayOperOpenHhmm"));
					museum.setWeekdayOperColseHhmm(rs.getString("weekdayOperColseHhmm"));
					museum.setHolidayOperOpenHhmm(rs.getString("holidayOperOpenHhmm"));
					museum.setHolidayCloseOpenHhmm(rs.getString("holidayCloseOpenHhmm"));
					museum.setRstdeInfo(rs.getString("rstdeInfo"));
					museum.setAdultChrge(rs.getString("adultChrge"));
					museum.setYngbgsChrge(rs.getString("yngbgsChrge"));
					museum.setRstdeInfo(rs.getString("rstdeInfo"));
					museum.setChildChrge(rs.getString("childChrge"));
					museum.setEtcChrgeInfo(rs.getString("etcChrgeInfo"));
					museum.setFcltyIntrcn(rs.getString("fcltyIntrcn"));
					museum.setRstdeInfo(rs.getString("rstdeInfo"));
					museum.setTrnsportInfo(rs.getString("trnsportInfo"));
					museum.setPhoneNumber(rs.getString("phoneNumber"));
					museum.setInstitutionNm(rs.getString("institutionNm"));
					museum.setInstitutionNm(rs.getString("institutionNm"));
					museum.setCnt(rs.getInt("cnt"));

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return museum;
		}

	public static void main(String[] args) {
//		Connection conn = getConnection();
//		MuseumDao dao = new MuseumDao();
//
//		
//		Museum m = dao.findMuseumByNo(conn, 1645);
//		dao.updateReadCount(conn, m);
//		System.out.println(m.toString());
//		JDBCTemplate.commit(conn);
//		System.out.println();
//		m = dao.findMuseumByNo(conn, 1645);
//		
//		System.out.println(m.toString());
	}	
}
