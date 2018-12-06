
package ticket.service.admin.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.UserDao;
import ticket.dto.User;
import ticket.service.admin.face.AdminUserService;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	@Autowired UserDao uDao;

	@Override
	public String getSearch(HttpServletRequest req) {
		return null;
	}

	@Override
	public int getTotalUser(String search) {
		 
		return 0;
	}

	@Override
	public void changeUserGrade(User user) {
		 
		
	}

	@Override
	public List getBookDetail(User user) {
		 
		return null;
	}

	@Override
	public int getConnectUser() {
		 
		return 0;
	}

	@Override
	public int getUnanswered() {
		 
		return 0;
	}
}
	
