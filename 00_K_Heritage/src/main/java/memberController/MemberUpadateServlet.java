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

// 여기서 정보 수정하면 업데이트 되는거 만들기

@WebServlet("/memberUpdate.do")
public class MemberUpadateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet 실행중");
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost 실행중");
		try {
			
			HttpSession session = req.getSession();
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

			if(loginMember == null) {
				req.setAttribute("msg", "잘못된 접근입니다.");
				req.setAttribute("location", "/");
				req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
				return;
			}

			// u 코드 바뀌면 안됌!!
			MemberVo newMember = new MemberVo();
			newMember.setUCode(loginMember.getUCode()); 
			newMember.setUName(req.getParameter("UName"));
			newMember.setUTel(req.getParameter("UTel"));
			newMember.setUEmail(req.getParameter("UEmail"));
			newMember.setUPw(req.getParameter("UPw"));
			newMember.setGender(req.getParameter("gender"));

			int result = service.save(newMember);

			if(result > 0) {

				newMember = service.findMemberById(loginMember.getId());
				
				session.setAttribute("loginMember", newMember); 
				
				req.setAttribute("msg", "업데이트에 성공하였습니다."); 
				req.setAttribute("location", "/mypage.do"); 
				req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); 
				return;
				
			} else {
				req.setAttribute("msg", "업데이트에 실패하였습니다.(3)");
				req.setAttribute("location", "/mypage.do");
				req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "잘못된 접근입니다.(2)");
			req.setAttribute("location", "/");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
			return;
		}
	}
}