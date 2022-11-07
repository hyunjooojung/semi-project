package memberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberService;
import member.MemberVo;

@WebServlet("/delete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	@Override
	public String getServletName() {
		return "MemberDeleteServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			
			if(loginMember == null) {
				req.setAttribute("msg", "잘못된 접근입니다.");
				req.setAttribute("location", "/");
				req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
				return;
			}
			
			int result = service.delete(loginMember.getUCode());
			
			if(result > 0) {
				req.setAttribute("msg", "회원 탈퇴에 성공하였습니다.");
				req.setAttribute("location", "/logOut.do");
				req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", "회원 탈퇴에 실패하였습니다. 문의 부탁 드립니다.");
		req.setAttribute("location", "/logout");
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
