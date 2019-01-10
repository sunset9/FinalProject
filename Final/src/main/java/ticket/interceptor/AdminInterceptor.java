package ticket.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ticket.dto.User;

public class AdminInterceptor
	extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(HandlerInterceptorAdapter.class); 

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler )
			throws Exception {
		
		logger.info(" + + + 인터셉터 시작 + + +");
		
		logger.info("  Request URI : " + request.getRequestURI());
		
		HttpSession session = request.getSession();
		
		if( session.getAttribute("login") == null ) {
			logger.info(" >> 접속불가 : 비로그인 상태");
			
			response.sendRedirect("/user/login?targetUrl="+request.getRequestURI());
			return false; //컨트롤러 접근 금지
		} else {
			logger.info(" >> 로그인 상태");
			logger.info(" >> 등급 : "+ ((User)session.getAttribute("loginUser")).getmGrade());
			
			if(!"관리자".equals(((User)session.getAttribute("loginUser")).getmGrade())) {
				logger.info(" >> 일반사용자 로그인 상태");
				response.sendRedirect("/ticket/ticketmain");
				return false; //컨트롤러 접근 금지
			}
		}
		
		logger.info(" >> 관리자 로그인 상태");
		return true; //컨트롤러 접근 허용
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info(" + + + 인터셉터 종료 + + +");
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}

















