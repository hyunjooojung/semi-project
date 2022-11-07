package MuseumController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Museum.Museum;
import Museum.MuseumService;
import common.PageInfo;

@WebServlet("/museum")
public class MuseumListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MuseumService service = new MuseumService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int museumCount = 0;
		PageInfo pageInfo = null;
		List<Museum> list = null;
		Map<String, String> searchMap = new HashMap<>();

		try {
			String name = "";
			String area = "";
			String sort = "";

			name = req.getParameter("name");
			area = req.getParameter("area");
			sort = req.getParameter("sort");
			
			System.out.println(name);
			System.out.println(area);
			System.out.println(sort);

			// 이름이 null이 아니면
			if (name != null && name.length() > 0) {
				searchMap.put("name", name);
			}

			// 지역이 null이 아니면
			if (area != null && area.length() > 0) {
				searchMap.put("area", area);
			}

			// 정렬이 null이 아니면
			if (sort != null && sort.length() > 0) {
				searchMap.put("sort", sort);
			}

			page = Integer.parseInt(req.getParameter("page"));
			
		} catch (Exception e) {}

		museumCount = service.getMuseumCount(searchMap);
		pageInfo = new PageInfo(page, 3, museumCount, 8);
		list = service.getMuseumlist(pageInfo, searchMap);

		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/museum/mu_ser.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}
}
