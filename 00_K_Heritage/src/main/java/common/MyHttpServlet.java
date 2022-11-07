package common;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberVo;



// Servlet의 공통 기능을 모으는 코드
public abstract class MyHttpServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	// 공통 문자열 영역
	public static final String SESSION_USER_ID = "loginMemeberVo";
	
	abstract public String getServletName();
	
	public MemberVo getSessionMemeberVo(HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			MemberVo loginMemeberVo = (MemberVo)session.getAttribute(SESSION_USER_ID);
			return loginMemeberVo;
		} catch (Exception e) {
		}
		return null;
	}
	
	public void setSessionMemeberVo(HttpServletRequest req, MemberVo MemeberVo) {
		try {
			HttpSession session = req.getSession();
			session.setAttribute(SESSION_USER_ID, MemeberVo);
		} catch (Exception e) {
		}
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Call!! " + getServletName() +", method : " + req.getMethod());
		super.service(req, resp);
	}
	
	// 공통 common page send 기능
	public void sendCommonPage(String msg, String path, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	// 공통 common page send 기능
	public void sendCommonPage(String msg, String path, String script, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", path);
		req.setAttribute("script", script);
		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
	}
	
	// upload 파일 삭제
	public void deleteFile(String fileName) {
		if(fileName == null || fileName.length() <= 0) {
			return;
		}
		try {
			String resourcePath = getServletContext().getRealPath("/resources/upload/board");
			File deleteFile = new File(resourcePath,fileName);
			deleteFile.delete();
		} catch (Exception e) {}
	}
}
