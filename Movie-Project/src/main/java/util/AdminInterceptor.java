package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session != null) {
			String[] user = (String[])session.getAttribute("user");
			if(user[0] != null) {
				if(user[0].equals("admin")) {
					return true;
				} else {
					response.sendRedirect("/home");					
					return false;
				}				
			} else {
				response.sendRedirect("/login/login");
			}
			
		}
		response.sendRedirect("/login/login");
		return false;
	}
}
