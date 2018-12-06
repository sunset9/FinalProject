package ticket.service.impl;

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
	public int loginCheck(User user) {
	
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
	public void join(User user) {
		userDao.insert(user);
	}



}
