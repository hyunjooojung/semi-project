package memberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;

@WebServlet("/checkId2")
public class MemberCheckIdServletForAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("userId");
		System.out.println("중복 확인 Id : " + userId);
		
		boolean isDuplicated = service.isDuplicated(userId);
		
		if(isDuplicated == true) { // 사용중이다.
			resp.getWriter().append("used");
		} else { // 사용안되는 중
			resp.getWriter().append("unused");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
