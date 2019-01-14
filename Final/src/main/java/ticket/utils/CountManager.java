package ticket.utils;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountManager implements HttpSessionListener {
	public static int count;

	public static int getCount() {
		return count;
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
	//	System.out.println("만들어집니다");
		// 세션이 만들어질 때 호출
		HttpSession session = se.getSession(); // request에서 얻는 session과 동일한 객체
		session.setMaxInactiveInterval(3600);

		count++;

		session.getServletContext().log(session.getId() + " 세션생성 " + ", 접속자수 : " + count);

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// 세션이 소멸될 때 호출
		count--;
		if (count < 0)
			count = 0;

		HttpSession session = se.getSession();
		session.getServletContext().log(session.getId() + " 세션소멸 " + ", 접속자수 : " + count);
	}

}
