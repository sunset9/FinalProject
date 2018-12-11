package ticket.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.UserDao;
import ticket.dto.User;
import ticket.service.face.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public int loginCheck(User user, HttpSession session) {
	
		if(userDao.selectCntUser(user) == 1) { 
			session.setAttribute("login", true);
			user = userDao.selectUser(user);
			session.setAttribute("loginUser", user);
			
		} else {
			session.setAttribute("login", false);
		}
		return 	userDao.selectCntUser(user);
	}
	

	@Override
	public boolean checkPw(User user) {
		userDao.selectPwByUserIdx(user);
		return false;
	}

	@Override
	public User getUser(User user) {
		userDao.selectUser(user);
		return null;
	}

	@Override
	public void update(User user) {
		userDao.updateUser(user);
	}

	@Override
	public int join(User user) {
		return userDao.insert(user);
	}


	@Override
	public int checkSignup(String email) {
		return userDao.selectUserByEmail(email);
	}


	@Override
	public int checkNick(String nick) {
		return userDao.selectUserByNick(nick);
	}



}
