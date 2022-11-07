package culture;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import Museum.Museum;
import common.PageInfo;

public class CultureService {
	
	private CultureDIDao dao = new CultureDIDao();
	private Connection conn = null;
	
	public CultureService() {
		conn = getConnection();
	}
	
	public int insert(CultureDiVo culturedi) {
		int result = dao.insert(conn, culturedi);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int insert(CultureImgVo cultureimg) {
		int result = dao.insert(conn, cultureimg);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int getCultureCount(Map<String, String> searchMap) {
		Connection conn = getConnection();
		int result = dao.getCultureCount(conn, searchMap);
		close(conn);
		return result;
	}
	
	public List<CultureDiVo> getCultureList(PageInfo pageinfo, Map<String, String> searchMap) {
		Connection conn = getConnection();
		List<CultureDiVo> list = dao.findAll(conn, pageinfo, searchMap);
		close(conn);
		return list;
	}
	
	public CultureDiVo getcultCultureDiVo(String ccbaMnm1) {
		Connection conn = getConnection();
		CultureDiVo culture = dao.getcuCultureDiVo(conn, ccbaMnm1);
		close(conn);
		return culture;
	}
	
	public List<CultureImgVo> getCultureImgVos(String ccbaasno, String ccbactcd, int ccbakdcd) {
		Connection conn = getConnection();
		List<CultureImgVo> img = dao.getcuCultureimg(conn, ccbaasno, ccbactcd, ccbakdcd);
		close(conn);
		return img;
	}
	
	public List<CultureDiVo> surroundingList(double longitude, double latitude){
		Connection conn = getConnection();
		List<CultureDiVo> img = dao.surroundingList(conn, longitude, latitude);
		close(conn);
		return img;
	}

	public List<Museum> surroundingmList(Double longitude, Double latitude) {
		Connection conn = getConnection();
		List<Museum> mlist = dao.surroundingmList(conn, longitude, latitude);
		close(conn);
		return mlist;
	}
}
