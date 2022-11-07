package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

@WebServlet("/index.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final MainService service = new MainService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
		List<MainVO> poplist = service.PopMusuem();
		List<MainVO> todaylist = service.TodayCultureDi();

		req.setAttribute("poplist", poplist);
		req.setAttribute("todaylist", todaylist);
		req.getRequestDispatcher("/views/main/main.jsp").forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
