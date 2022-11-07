package cultureController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Museum.Museum;
import culture.CultureDiVo;
import culture.CultureImgVo;
import culture.CultureService;

@WebServlet("/cul_di")
public class CultureDiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CultureService service = new CultureService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ccbaMnm1 = req.getParameter("CcbaMnm1");

		CultureDiVo culture = service.getcultCultureDiVo(ccbaMnm1);
		List<CultureImgVo> imagelist = service.getCultureImgVos(culture.getCcbaAsno(), culture.getCcbaCtcd(),
				culture.getCcbaKdcd());

		Double longitude = Double.parseDouble(culture.getLongitude());
		Double latitude = Double.parseDouble(culture.getLatitude());

		if (longitude != 0 && latitude != 0) {
			
			List<CultureDiVo> surroundlist = service.surroundingList(longitude, latitude);
			List<Museum> surroundmlist = service.surroundingmList(longitude, latitude);
			req.setAttribute("culture", culture);
			req.setAttribute("img", imagelist);
			req.setAttribute("surroundlist", surroundlist);
			req.setAttribute("surroundmlist", surroundmlist);
		} else {
			req.setAttribute("culture", culture);
			req.setAttribute("img", imagelist);
		}
		req.getRequestDispatcher("/views/culture/cul_det.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
