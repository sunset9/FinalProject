
package ticket.service.admin.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import ticket.controller.admin.AdminUserController;
import ticket.dao.face.UserDao;
import ticket.dto.User;
import ticket.service.admin.face.AdminUserService;
import ticket.utils.Paging;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminUserServiceImpl.class);
	
	@Autowired UserDao uDao;

	@Override
	public String getSearch(HttpServletRequest req) {
		String search = req.getParameter("userListSearch");
		return search;
	}

	@Override
	public int getTotalUser(String search) {
		return uDao.selectCntUserBySearch(search);
	}

	@Override
	public void changeUserGrade(int currUser, int currUserGrade) {
		uDao.updateUserGrade(currUser, currUserGrade);
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

	@Override
	public List<User> getPagingListByPaging(Paging paging) {
		return uDao.selectPagingUserListByPaging(paging);
	}

	@Override
	public User getUserByUserIdx(User user) {
		return uDao.selectUser(user);
	}
}
	
