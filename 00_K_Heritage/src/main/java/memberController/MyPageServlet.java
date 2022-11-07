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

@WebServlet("/mypage.do")
public class MyPageServlet extends  HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			MemberVo member = (MemberVo) session.getAttribute("loginMember");
			String userId = member.getId();

			MemberVo memberInfo = service.findMemberById(userId);
			
			System.out.println(memberInfo.toString());
			
			if(memberInfo != null) {
//				req.setAttribute("member", memberInfo); 
				req.getRequestDispatcher("/views/member/myPage.jsp").forward(req, resp);
				return;
								
			}
		} catch (Exception e) {

		}
		resp.sendRedirect(req.getContextPath() + "/");
	}
}