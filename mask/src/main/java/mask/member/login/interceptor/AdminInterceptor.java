package mask.member.login.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean masterFlag = false;

		System.out.println("admin Login Interceptor");

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("session_MEMBER");
		obj = session.getAttribute("session_MEM_ID");

		String admin = "admin";

		/*
		 * if (request.getSession().getAttribute("session_MEM_ID") != null &&
		 * Integer.parseInt(String.valueOf(request.getSession().getAttribute(
		 * "session_MEM_NUM"))) == 3) { // 세션 ID가 admin 이면
		 */

		if (request.getSession().getAttribute("session_MEM_ID") != null
				&& request.getSession().getAttribute("session_MEM_ID").equals(admin)) {
			// 세션 ID가 admin 이면

			System.out.println("admin 인증!!! : " + obj); // admin 인증
			System.out.println(masterFlag);
			masterFlag = true;

		} else {

			System.out.println("admin 미인증!!! : "); // admin 미인증

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>alert('접근불가!!'); location.href='http://localhost:9010/mask/';</script>");

			// response.sendRedirect(request.getContextPath() + "/");

			// 해당 페이지로 보내기
			System.out.println(masterFlag);
			masterFlag = false;
		}

		return masterFlag;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}