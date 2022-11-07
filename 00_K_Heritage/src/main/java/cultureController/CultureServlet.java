package cultureController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import culture.CultureDiVo;
import culture.CultureService;

@WebServlet("/culList")
public class CultureServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private static CultureService service = new CultureService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int cultureCount = 0;
		PageInfo pageInfo = null;
		List<CultureDiVo> list = null;
		Map<String, String> searchMap = new HashMap<>();
		
		try {
			
			// value
			String value1 = req.getParameter("value1");
			String value2 = req.getParameter("value2");
			String value3 = req.getParameter("value3");
			String value4 = req.getParameter("value4");
			
			// 확인코드
//			System.out.println(value1);
//			System.out.println(value2);
//			System.out.println(value3);
//			System.out.println(value4);
			
			// 문화재명검색
			if(value1 != null && value1.length()>0) {
				String key1 = "ccbaMnm1";
//				System.out.println(key1);
				
				searchMap.put(key1, value1);
			}
			// 지정종목검색
			if(value2 != null && value2.length()>0) {
				String key2 = "ccmaName";
//				System.out.println(key2);
				
				searchMap.put(key2, value2);
			}
			// 시대별검색
			if(value3 != null && value3.length()>0) {
				String key3 = "ccceName";
//				System.out.println(key3);
				
				searchMap.put(key3, value3);
			}
			// 지역별검색
			if(value4 != null && value4.length()>0) {
				String key4 = "ccbaCtcdNm";
//				System.out.println(key4);
					
				searchMap.put(key4, value4);
			}
			
			page = Integer.parseInt(req.getParameter("page"));
			
			
		} catch (Exception e) {}
		
		cultureCount = service.getCultureCount(searchMap);
		pageInfo = new PageInfo(page, 3, cultureCount, 12);
		list = service.getCultureList(pageInfo, searchMap);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/culture/cul_ser.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
