package MuseumController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Museum.Museum;
import Museum.MuseumService;

@WebServlet("/museuminfo")
public class MuseumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MuseumService service = new MuseumService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int museumNo = Integer.parseInt(req.getParameter("MuseumCd"));
		
		Museum museum = service.findMuseumByNo(museumNo, true);
		
		if (museum == null) {
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		}
		
		System.out.println(museum.toString());
		
		req.setAttribute("museum", museum);
		req.getRequestDispatcher("/views/museum/mu_det.jsp").forward(req, resp);
	}
}
