package ticket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MyChoiceDao;
import ticket.dao.face.PfmDao;
import ticket.dao.face.UserDao;
import ticket.dto.MyChoice;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
import ticket.dto.User;
import ticket.service.face.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private MyChoiceDao myChoiceDao;
	@Autowired
	private PfmDao pfmDao;
	
	@Override
	public int loginCheck(User user, HttpSession session) {
			int userIdx =userDao.selectCntUser(user) ;
		if(userIdx!= 0) { 
			user.setUserIdx(userIdx);
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


	@Override
	public List<MyChoice> choicePfmList(int userIdx) {
		return myChoiceDao.selectChoiceList(userIdx);
	}


	@Override
	public List<Performance> recommendPfm(List<PreferTheme> ptList) {
		Map map = new HashMap<>();
		map.put("ptList", ptList);
		pfmDao.selectPfmByPreferTheme(map);
		return null;
	}



}
